import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final CollectionReference _adminCollection =
      FirebaseFirestore.instance.collection('admins');

  Future<void> addAdminToTournament(String adminId, String tournamentId) async {
    final tournamentRef = _adminCollection.doc(tournamentId).collection('users');

    await tournamentRef.doc(adminId).set({});
  }

  Future<void> removeAdminFromTournament(
      String adminId, String tournamentId) async {
    final tournamentRef = _adminCollection.doc(tournamentId).collection('users');

    await tournamentRef.doc(adminId).delete();
  }
}