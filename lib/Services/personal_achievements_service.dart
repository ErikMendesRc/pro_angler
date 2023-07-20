import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/personal_achievement.dart';

class PersonalAchievementsService {
  final CollectionReference _achievementsCollection =
      FirebaseFirestore.instance.collection('achievements');

  Future<void> createAchievement(PersonalAchieviments achievement) async {
    await _achievementsCollection.doc(achievement.id).set(achievement.toJson());
  }

  Future<PersonalAchieviments?> getAchievementById(String achievementId) async {
    final snapshot = await _achievementsCollection.doc(achievementId).get();
    final achievementData = snapshot.data() as Map<String, dynamic>?;
    return achievementData != null
        ? PersonalAchieviments.fromJson(achievementData)
        : null;
  }

  Future<void> updateAchievement(PersonalAchieviments achievement) async {
    await _achievementsCollection.doc(achievement.id).update(achievement.toJson());
  }

  Future<void> deleteAchievement(String achievementId) async {
    await _achievementsCollection.doc(achievementId).delete();
  }

  Future<void> associateAchievementWithUser(
      String achievementId, String userId) async {
    final achievementRef =
        _achievementsCollection.doc(achievementId).collection('users');

    await achievementRef.doc(userId).set({});
  }

  Future<void> associateAchievementWithTournament(
      String achievementId, String tournamentId) async {
    final achievementRef =
        _achievementsCollection.doc(achievementId).collection('tournaments');

    await achievementRef.doc(tournamentId).set({});
  }
}