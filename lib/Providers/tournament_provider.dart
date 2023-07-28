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

  Future<List<Tournament>?> fetchAllTournaments() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();
      _tournaments = await _tournamentService.getAllTournaments();

      for (var tournament in _tournaments) {
        _updateTournamentStatus(tournament);
      }

      _isLoading = false;
      notifyListeners();
      return _tournaments;
    } catch (e) {
      _isLoading = false;
      _error = 'Falha ao buscar os torneios: $e';
      notifyListeners();
      return null;
    }
  }

  bool _isFetched = false;
  Future<List<Tournament>?> fetchTournamentsByUserId(String userId) async {
    if (!_isFetched) {
      try {
        _isLoading = true;
        _error = '';
        notifyListeners();
        _tournaments = await _tournamentService.getTournamentsByUserId(userId);

        for (var tournament in _tournaments) {
          _updateTournamentStatus(tournament);
        }

        _isFetched = true;
        _isLoading = false;
        notifyListeners();
        return _tournaments;
      } catch (e) {
        _isLoading = false;
        _error = 'Falha ao buscar os torneios: $e';
        notifyListeners();
        return null;
      }
    } else {
      return _tournaments;
    }
  }

  void _updateTournamentStatus(Tournament tournament) {
    final currentDate = DateTime.now();
    DateTime tournamentStartDate = tournament.startDate.toDate();
    DateTime tournamentEndDate = tournament.endDate.toDate();

    if (currentDate.isBefore(tournamentStartDate)) {
      tournament.status = 'Aguardando';
    } else if (currentDate.isAfter(tournamentStartDate) &&
        currentDate.isBefore(tournamentEndDate)) {
      tournament.status = 'Em Andamento';
    } else {
      tournament.status = 'Finalizado';
    }
  }
}
