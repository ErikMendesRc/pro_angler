import 'package:flutter/foundation.dart';
import 'package:pro_angler/Models/tournament.dart';

import '../Mock/tournament_mock.dart';

class TournamentProvider with ChangeNotifier {
  final List<Tournament> _tournaments = MockData.getTodosOsTorneios();
  
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

    await Future.delayed(const Duration(seconds: 2));

    List<Tournament> filteredTournaments = _tournaments
        .where((tournament) => tournament.status == 'Em Andamento')
        .toList();
    _currentTournament = null;
    _tournaments.clear();
    _tournaments.addAll(filteredTournaments);

    final currentDate = DateTime.now();
      for (var tournament in _tournaments) {
        if (tournament.endDate.isBefore(currentDate) && tournament.status != 'Finalizado') {
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


  void setCurrentTournament(Tournament tournament) {
    _currentTournament = tournament; // Atualiza o valor corretamente
    notifyListeners();
  }
}


