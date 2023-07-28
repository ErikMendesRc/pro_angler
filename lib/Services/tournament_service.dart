import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/tournament.dart';

class TournamentService {
  final CollectionReference _tournamentsRef =
      FirebaseFirestore.instance.collection('tournaments');

  // Métodos de criação
  Future<void> createTournament(Tournament tournament) {
    return _tournamentsRef.add(tournament.toJson());
  }

  // Métodos de obtenção
  Future<Tournament?> getTournamentById(String id) async {
    final tournamentSnapshot = await _tournamentsRef.doc(id).get();
    if (tournamentSnapshot.exists) {
      final tournamentData = tournamentSnapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      return tournament;
    }
    return null;
  }

  Future<List<Tournament>> getAllTournaments() async {
    final tournamentsSnapshot = await _tournamentsRef.get();
    final tournamentsData = Map<String, dynamic>.fromEntries(tournamentsSnapshot
        .docs
        .map((snapshot) => MapEntry(snapshot.id, snapshot.data())));
    final List<Tournament> tournaments = tournamentsData.entries.map((entry) {
      final tournament = Tournament.fromJson(entry.value);
      tournament.id = entry.key;
      return tournament;
    }).toList();

    return tournaments;
  }

  Future<List<Tournament>> getTournamentsByUserId(String userId) async {
    final competitorsQuerySnapshot = await _tournamentsRef
        .where('competitorsIds', arrayContains: userId)
        .get();

    final adminQuerySnapshot =
        await _tournamentsRef.where('administratorId', isEqualTo: userId).get();

    final List<Tournament> tournaments = [];

    for (var snapshot in competitorsQuerySnapshot.docs) {
      final tournamentData = snapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      tournament.id = snapshot.id;
      tournaments.add(tournament);
    }

    for (var snapshot in adminQuerySnapshot.docs) {
      final tournamentData = snapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      tournament.id = snapshot.id;
      tournaments.add(tournament);
    }

    return tournaments;
  }

  Future<List<Tournament>> getTournamentsByAdmin(String userId) async {
    final querySnapshot =
        await _tournamentsRef.where('administratorId', isEqualTo: userId).get();

    final List<Tournament> tournaments = querySnapshot.docs.map((snapshot) {
      final tournamentData = snapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      tournament.id = snapshot.id;
      return tournament;
    }).toList();

    return tournaments;
  }

  // Métodos de atualização
  Future<void> updateTournament(Tournament tournament) async {
    final tournamentDoc = _tournamentsRef.doc(tournament.id);
    final tournamentSnapshot = await tournamentDoc.get();

    if (tournamentSnapshot.exists) {
      await tournamentDoc.update(tournament.toJson());
    } else {
      await tournamentDoc.set(tournament.toJson());
    }
  }

  // Métodos de exclusão
  Future<void> deleteTournament(String id) async {
    await _tournamentsRef.doc(id).delete();
  }

  // Métodos para lidar com participantes
  Future<void> addUserToTournament(String userId, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);
    final participantsRef = tournamentRef.collection('participants');

    await participantsRef.add({'userId': userId});
  }

  Future<void> removeUserFromTournament(
      String userId, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);
    final participantsRef = tournamentRef.collection('participants');

    final querySnapshot =
        await participantsRef.where('userId', isEqualTo: userId).get();
    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

  // Métodos para lidar com moderadores
  Future<void> addModeratorToTournament(
      String userId, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);

    await tournamentRef.update({
      'moderators': FieldValue.arrayUnion([userId]),
    });
  }

  Future<void> removeModeratorFromTournament(
      String userId, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);

    await tournamentRef.update({
      'moderators': FieldValue.arrayRemove([userId]),
    });
  }

  // Métodos para lidar com "catches"
  Future<void> addCatchToTournament(Catch catchs, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);
    final catchesRef = tournamentRef.collection('catches');

    await catchesRef.add(catchs.toJson());
  }

  Future<void> removeCatchFromTournament(
      String catchId, String tournamentId) async {
    final tournamentRef = _tournamentsRef.doc(tournamentId);
    final catchesRef = tournamentRef.collection('catches');

    final querySnapshot =
        await catchesRef.where('id', isEqualTo: catchId).get();
    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
