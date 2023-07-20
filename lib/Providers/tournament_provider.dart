import 'package:flutter/foundation.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Services/tournament_service.dart';

class TournamentProvider with ChangeNotifier {
  final TournamentService _tournamentService = TournamentService();
  List<Tournament> _tournaments = [];
  bool _isLoading = false;
  String _error = '';
  Tournament? _currentTournament;

  List<Tournament> get tournaments => _tournaments;
  bool get isLoading => _isLoading;
  String get error => _error;
  Tournament? get currentTournament => _currentTournament;

  Future<void> fetchTournaments() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      _tournaments = await _tournamentService.getAllTournaments();

      final currentDate = DateTime.now();
      for (var tournament in _tournaments) {
        if (tournament.endDate.isBefore(currentDate) &&
            tournament.status != 'Finalizado') {
          tournament.status = 'Finalizado';
        }
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Falha ao buscar os torneios: $e';
      notifyListeners();
    }
  }

  bool isUserParticipatingInAnyTournament(String userId) {
    return _tournaments.any((tournament) =>
        tournament.participatingUsers?.contains(userId) ?? false);
  }

  void setCurrentTournament(Tournament tournament) {
    _currentTournament = tournament;
    notifyListeners();
  }
}