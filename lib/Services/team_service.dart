import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/achiviement.dart';
import 'package:pro_angler/Models/team.dart';

class TeamService {
  final CollectionReference _teamsCollection =
      FirebaseFirestore.instance.collection('teams');

  Future<void> createTeam(Team team) async {
    await _teamsCollection.doc(team.id).set(team.toJson());
  }

  Future<Team?> getTeamById(String teamId) async {
    final snapshot = await _teamsCollection.doc(teamId).get();
    final teamData = snapshot.data() as Map<String, dynamic>?;
    return teamData != null ? Team.fromJson(teamData) : null;
  }

  Future<List<Team>> getAllTeams() async {
    final snapshot = await _teamsCollection.get();
    final teamsData =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    return teamsData.map((teamData) => Team.fromJson(teamData)).toList();
  }

  Future<void> updateTeam(Team team) async {
    await _teamsCollection.doc(team.id).update(team.toJson());
  }

  Future<void> deleteTeam(String teamId) async {
    await _teamsCollection.doc(teamId).delete();
  }

  Future<void> addParticipantToTeam(String userId, String teamId) async {
    final teamRef = _teamsCollection.doc(teamId);
    final participantsRef = teamRef.collection('participants');

    await participantsRef.doc(userId).set({});
  }

  Future<void> removeParticipantFromTeam(String userId, String teamId) async {
    final teamRef = _teamsCollection.doc(teamId);
    final participantsRef = teamRef.collection('participants');

    await participantsRef.doc(userId).delete();
  }

  Future<void> addAchievementToTeam(
      ChampionTrophys achievement, String teamId) async {
    final teamRef = _teamsCollection.doc(teamId);
    final achievementsRef = teamRef.collection('achievements');

    await achievementsRef.doc(achievement.id).set(achievement.toJson());
  }

  Future<void> removeAchievementFromTeam(
      String achievementId, String teamId) async {
    final teamRef = _teamsCollection.doc(teamId);
    final achievementsRef = teamRef.collection('achievements');

    await achievementsRef.doc(achievementId).delete();
  }

  Future<Team?> getTeamByCreatorId(String creatorId) async {
    final snapshot = await _teamsCollection.where('creatorId', isEqualTo: creatorId).limit(1).get();
    final teamData = snapshot.docs.isNotEmpty ? snapshot.docs.first.data() as Map<String, dynamic> : null;
    return teamData != null ? Team.fromJson(teamData) : null;
  }
}
