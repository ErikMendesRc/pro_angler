import 'package:flutter/material.dart';
import 'package:pro_angler/Mock/mock_teams.dart';
import '../Mock/mock_users.dart';
import '../Mock/tournament_mock.dart';
import '../Models/team.dart';
import '../Models/tournament.dart';
import '../Models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user = MockUsers.getAllUsers().first;
  User? _currentUser = MockUsers.getAllUsers().first;
  late Team? _team;

  final List<User> _allUsers = MockUsers.getAllUsers();

  User? get user => _user;
  User? get currentUser => _currentUser;

  void setUserById(String userId) {
    _user = MockUsers.getUserById(userId);
    _currentUser = _user;
    _team = getTeamByCreatorId(userId);
    notifyListeners();
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  List<User> getAllUsers() {
    return _allUsers;
  }

  Team? getTeamByCreatorId(String creatorId) {
    return MockTeams.getTeamByCreatorId(creatorId);
  }

  List<Tournament> getParticipatingTournaments() {
    final user = _user;
    if (user != null) {
      return MockTournaments.getTournamentsByUserId(user.id);
    } else {
      return [];
    }
  }
}
