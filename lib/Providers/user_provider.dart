import 'package:flutter/material.dart';
import 'package:pro_angler/Mock/mock_teams.dart';
import '../Mock/mock_users.dart';
import '../Models/team.dart';
import '../Models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user = MockUsers.getAllUsers().first;
  late Team? _team;
  
  final List<User> _allUsers = MockUsers.getAllUsers();

  User? get user => _user;

  void setUserById(String userId) {
    _user = MockUsers.getUserById(userId);
    _team = getTeamByCreatorId(userId);
    notifyListeners();
  }

  List<User> getAllUsers() {
    return _allUsers;
  }

  Team? getTeamByCreatorId(String creatorId) {
    return MockTeams.getTeamByCreatorId(creatorId);
  }
}

