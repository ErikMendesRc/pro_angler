import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Models/team.dart';
import 'package:pro_angler/Services/user_service.dart';
import 'package:pro_angler/Services/team_service.dart';
import 'package:pro_angler/Services/tournament_service.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;
  UserData? _currentUser;
  Team? _team;

  final UserService _userService = UserService();
  final TeamService _teamService = TeamService();
  final TournamentService _tournamentService = TournamentService();

  UserData? get user => _user;
  UserData? get currentUser => _currentUser;

  Future<void> setUserById(String userId) async {
    _user = await _userService.getUserById(userId);
    _currentUser = _user;
    _team = await _teamService.getTeamByCreatorId(userId);
    notifyListeners();
  }

  void setCurrentUser(UserData user) {
    _currentUser = user;
    notifyListeners();
  }

  void setUser(UserData user) {
    _user = user;
    _currentUser = user;
    notifyListeners();
  }

  UserData? getCurrentUser() {
    return _currentUser;
  }

  Future<List<UserData>> getAllUsers() async {
    return _userService.getAllUsers();
  }

  Future<Team?> getTeamByCreatorId(String creatorId) async {
    return _teamService.getTeamByCreatorId(creatorId);
  }

  Future<List<Tournament>> getParticipatingTournaments() async {
    final user = _user;
    if (user != null) {
      return _tournamentService.getTournamentsByUserId(user.id);
    } else {
      return [];
    }
  }

  Future<List<UserData>> searchUsers(String query) async {
    return _userService.searchUsers(query);
  }

  Future<UserData> getUserById(String userId) async {
    return _userService.getUserById(userId);
  }

  Future<void> fetchUser(String userId) async {
    try {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        _user = UserData.fromJson(userSnapshot.data()!);
        _currentUser = _user;
        _team = await _teamService.getTeamByCreatorId(userId);
        notifyListeners();
      } else {
        // Usuário não encontrado no Firestore
        _user = null;
        _currentUser = null;
        _team = null;
        notifyListeners();
      }
    } catch (error) {
      // Tratamento de erro ao buscar o usuário
      print('Erro ao buscar dados do usuário: $error');
    }
  }
}
