import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/user.dart';

class TournamentRegistrationController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isUserAlreadyRegistered(String userId, String tournamentId) async {
    try {
      // Verifique se o usuário já está inscrito no torneio
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();
      if (!userSnapshot.exists) {
        return false;
      }

      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

      if (userData != null) {
        List<String>? myTournamentsIds =
            (userData['myTournamentsIds'] as List<dynamic>).map((e) => e.toString()).toList();

        if (myTournamentsIds.contains(tournamentId)) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> registerUserForTournament(UserData currentUser, String tournamentId) async {
    try {
      // Verifique se o usuário já está inscrito
      bool isRegistered = await isUserAlreadyRegistered(currentUser.id, tournamentId);
      if (isRegistered) {
        throw Exception('O usuário já está inscrito no torneio.');
      }

      // Obtenha informações sobre o torneio
      DocumentSnapshot tournamentSnapshot =
          await _firestore.collection('tournaments').doc(tournamentId).get();

      if (!tournamentSnapshot.exists) {
        throw Exception('Torneio não encontrado.');
      }

      Map<String, dynamic>? tournamentData = tournamentSnapshot.data() as Map<String, dynamic>?;

       // Obtenha a lista de IDs dos competidores já inscritos no torneio
      if (tournamentData != null) {
        List<String>? competitorsIds =
            (tournamentData['competitorsIds'] as List<dynamic>).map((e) => e.toString()).toList();

        // Calcule o número da sorte com base na ordem de inscrição
        int luckyNumber = competitorsIds.length + 1;
        currentUser.tournamentLuckyNumbers![tournamentId] = luckyNumber;
        competitorsIds.add(currentUser.id);

        // Atualize os documentos no Firestore
        await _firestore.collection('users').doc(currentUser.id).update({
          'myTournamentsIds': FieldValue.arrayUnion([tournamentId]),
          'tournamentLuckyNumbers': currentUser.tournamentLuckyNumbers,
        });

        await _firestore.collection('tournaments').doc(tournamentId).update({
          'competitorsIds': competitorsIds,
        });
      }
    } catch (e) {
      // Lidar com erros, por exemplo, exibir uma mensagem de erro para o usuário.
    }
  }
}