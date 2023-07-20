import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/tournament.dart';

class TournamentService {
  final CollectionReference _tournamentsRef =
      FirebaseFirestore.instance.collection('tournaments');

  Future<Tournament> createTournament(Tournament tournament) async {
    final tournamentRef = await _tournamentsRef.add(tournament.toJson());
    final tournamentId = tournamentRef.id;

    return Tournament(
      id: tournamentId,
      organizerName: tournament.organizerName,
      administrators: tournament.administrators,
      name: tournament.name,
      description: tournament.description,
      startDate: tournament.startDate,
      endDate: tournament.endDate,
      location: tournament.location,
      modality: tournament.modality,
      type: tournament.type,
      entryFee: tournament.entryFee,
      prizes: tournament.prizes,
      status: tournament.status,
      teamBased: tournament.teamBased,
      rules: tournament.rules,
      isUserVerified: tournament.isUserVerified,
      isTournamentVerified: tournament.isTournamentVerified,
      isRegistered: tournament.isRegistered,
    );
  }

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

  Future<void> updateTournament(Tournament tournament) async {
    await _tournamentsRef.doc(tournament.id).update(tournament.toJson());
  }

  Future<void> deleteTournament(String id) async {
    await _tournamentsRef.doc(id).delete();
  }

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

  Future<List<Tournament>> getTournamentsByUserId(String userId) async {
    final querySnapshot = await _tournamentsRef
        .where('participants', arrayContains: userId)
        .get();

    final List<Tournament> tournaments = querySnapshot.docs.map((snapshot) {
      final tournamentData = snapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      tournament.id = snapshot.id;
      return tournament;
    }).toList();

    return tournaments;
  }

  Future<List<Tournament>> getTournamentsByAdmin(String userId) async {
    final querySnapshot = await _tournamentsRef
        .where('administrators.id', isEqualTo: userId)
        .get();

    final List<Tournament> tournaments = querySnapshot.docs.map((snapshot) {
      final tournamentData = snapshot.data() as Map<String, dynamic>;
      final tournament = Tournament.fromJson(tournamentData);
      tournament.id = snapshot.id;
      return tournament;
    }).toList();

    return tournaments;
  }
}
