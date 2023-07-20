import 'package:flutter/material.dart';
import 'package:pro_angler/Models/team.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import 'package:pro_angler/Services/team_service.dart';

class TeamProvider with ChangeNotifier {
  final TeamService _teamService = TeamService();
  final TournamentProvider _tournamentProvider = TournamentProvider();
  Team? _team;

  Team? get team => _team;

  Tournament getTournamentById(String tournamentId) {
    final tournament = _tournamentProvider.tournaments.firstWhere(
      (tournament) => tournament.id == tournamentId,
      orElse: () => Tournament.empty(),
    );
    return tournament;
  }

  Future<void> fetchTeamData(String teamId) async {
    try {
      _team = await _teamService.getTeamById(teamId);
      notifyListeners();
    } catch (e) {
      print('Falha ao buscar os dados da equipe: $e');
    }
  }
}
