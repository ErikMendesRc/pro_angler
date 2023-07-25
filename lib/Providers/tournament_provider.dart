import 'package:flutter/foundation.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Services/tournament_service.dart';

class TournamentProvider with ChangeNotifier {
  final TournamentService _tournamentService = TournamentService();
  List<Tournament> _tournaments = [];
  bool _isLoading = false;
  String _error = '';
  Tournament? _currentTournament;

  // Getters
  List<Tournament> get tournaments => _tournaments;
  bool get isLoading => _isLoading;
  String get error => _error;
  Tournament? get currentTournament => _currentTournament;

  // Métodos para definir estado
  void setCurrentTournament(Tournament tournament) {
    _currentTournament = tournament;
    notifyListeners();
  }

  Future<void> createTournament(Tournament tournament) async {
    try {
      await _tournamentService.createTournament(tournament);
      _tournaments.add(tournament);
      notifyListeners();
    } catch (e) {
      _error = 'Falha ao criar torneio: $e';
      notifyListeners();
    }
  }

  // Métodos para busca
  Future<void> fetchTournaments() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();

      _tournaments = await _tournamentService.getAllTournaments();

      final currentDate = DateTime.now();
      for (var tournament in _tournaments) {
        DateTime tournamentEndDate = tournament.endDate.toDate();

        if (tournamentEndDate.isBefore(currentDate) &&
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

  // Métodos para verificar participação
  bool isUserParticipatingInAnyTournament(String userId) {
    return _tournaments.any(
        (tournament) => tournament.competitorsIds?.contains(userId) ?? false);
  }
}
