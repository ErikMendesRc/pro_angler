import 'package:flutter/material.dart';
import '../Models/team.dart';
import '../Models/tournament.dart';
import '../Models/user.dart';
import 'package:pro_angler/Services/user_service.dart';
import 'package:pro_angler/Services/team_service.dart';
import 'package:pro_angler/Services/tournament_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? _currentUser;
  Team? _team;

  final UserService _userService = UserService();
  final TeamService _teamService = TeamService();
  final TournamentService _tournamentService = TournamentService();

  User? get user => _user;
  User? get currentUser => _currentUser;

  Future<void> setUserById(String userId) async {
    _user = await _userService.getUserById(userId);
    _currentUser = _user;
    _team = await _teamService.getTeamByCreatorId(userId);
    notifyListeners();
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  User? getCurrentUser() {
    return _currentUser;
  }

  Future<List<User>> getAllUsers() async {
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

  Future<List<User>> searchUsers(String query) async {
    return _userService.searchUsers(query);
  }

  Future<User> getUserById(String userId) async {
    return _userService.getUserById(userId);
  }
}
