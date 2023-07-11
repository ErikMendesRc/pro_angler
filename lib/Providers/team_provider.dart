import 'package:flutter/material.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import '../Mock/mock_teams.dart';
import '../Models/team.dart';
import '../Models/tournament.dart';

class TeamProvider extends ChangeNotifier {
  Team? _team = MockTeams.getAllTeams().first;
  final TournamentProvider _tournamentProvider = TournamentProvider();

  Team? get team => _team;

  Tournament? getTournamentById(String tournamentId) {
    try {
      return _tournamentProvider.tournaments.firstWhere(
        (tournament) => tournament.id == tournamentId,
      );
    } catch (e) {
      return null;
    }
  }

  void fetchTeamData(String teamId) {

    Future.delayed(const Duration(seconds: 5), () {
      final fetchedTeam =
          MockTeams.getTeamById(teamId);
      _team = fetchedTeam;
      notifyListeners();
    });
  }
}
