import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/enum/fish_evaluation_status.dart';

class CatchService {
  final CollectionReference _catchesCollection =
      FirebaseFirestore.instance.collection('catches');

  Future<void> createCatch(Catch catchs) async {
    await _catchesCollection.doc(catchs.id).set(catchs.toJson());
  }

  Future<Catch?> getCatchById(String catchId) async {
    final snapshot = await _catchesCollection.doc(catchId).get();
    final catchData = snapshot.data() as Map<String, dynamic>?;
    return catchData != null ? Catch.fromJson(catchData) : null;
  }

  Future<void> updateCatch(Catch catchs) async {
    await _catchesCollection.doc(catchs.id).update(catchs.toJson());
  }

  Future<void> deleteCatch(String catchId) async {
    await _catchesCollection.doc(catchId).delete();
  }

  Future<void> evaluateCatch(
      String catchId, FishEvaluationStatus status) async {
    await _catchesCollection
        .doc(catchId)
        .update({'fishEvaluationStatus': status.toString()});
  }

  Future<void> validateCatch(String catchId, User validatingAdmin) async {
    await _catchesCollection
        .doc(catchId)
        .update({'validatingAdmin': validatingAdmin.toJson()});
  }

  Future<void> associateCatchWithParticipant(
      String catchId, String participantId) async {
    final catchRef = _catchesCollection.doc(catchId).collection('participants');

    await catchRef.doc(participantId).set({});
  }

  Future<void> associateCatchWithTournament(
      String catchId, String tournamentId) async {
    final catchRef = _catchesCollection.doc(catchId).collection('tournaments');

    await catchRef.doc(tournamentId).set({});
  }

  Future<List<Catch>> getCatchesByTournamentId(String tournamentId) async {
    final querySnapshot = await _catchesCollection
        .where('tournamentId', isEqualTo: tournamentId)
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getCatchesByParticipant(String participantId) async {
    final querySnapshot = await _catchesCollection
        .where('participantId', isEqualTo: participantId)
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getCatchesByValidationStatus(
      FishEvaluationStatus status) async {
    final querySnapshot = await _catchesCollection
        .where('fishEvaluationStatus', isEqualTo: status.toString())
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getCatchesByUserId(String userId) async {
    final querySnapshot = await _catchesCollection
        .where('participant.userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getPendingCatches() async {
    final querySnapshot = await _catchesCollection
        .where('fishEvaluationStatus',
            isEqualTo: FishEvaluationStatus.aguardandoAvaliacao.toString())
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getValidatedCatches() async {
    final querySnapshot = await _catchesCollection
        .where('fishEvaluationStatus',
            isEqualTo: FishEvaluationStatus.peixeValidado.toString())
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }

  Future<List<Catch>> getIvalidatedCatches() async {
    final querySnapshot = await _catchesCollection
        .where('fishEvaluationStatus',
            isEqualTo: FishEvaluationStatus.peixeInvalidado.toString())
        .get();

    return querySnapshot.docs.map((doc) {
      final catchData = doc.data() as Map<String, dynamic>;
      return Catch.fromJson(catchData);
    }).toList();
  }
}
