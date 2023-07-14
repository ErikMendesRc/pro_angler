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

  User? getCurrentUser() {
    return _currentUser;
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

  Future<List<User>> searchUsers(String query) async {
    // Simulação de pesquisa assíncrona
    await Future.delayed(const Duration(seconds: 5));

    // Lógica de busca de usuários (substitua pelo seu próprio código de pesquisa)
    List<User> results = [];
    List<User> allUsers = getAllUsers();

    for (User user in allUsers) {
      String name = user.name.toLowerCase();
      String email = user.email.toLowerCase();
      String searchQuery = query.toLowerCase();

      if (name.startsWith(searchQuery) || email.startsWith(searchQuery)) {
        results.add(user);
      }
    }
    return results;
  }

      User getUserById(String userId) {
      for (User user in getAllUsers()) {
        if (user.id == userId) {
          return user;
        }
      }
      // Caso não encontre o usuário, pode retornar null ou um objeto vazio
      return User(
        id: '',
        name: '',
        email: '',
        password: '',
        city: '',
      );
  }
}
