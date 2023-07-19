import 'package:flutter/material.dart';
import 'package:pro_angler/Mock/mock_catches.dart';
import 'package:pro_angler/Mock/tournament_mock.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/participant.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/enum/fish_evaluation_status.dart';

class CatchesProvider extends ChangeNotifier {
  final List<Catch> _catches = MockCatches.getCatchesForTournament('1');
  final List<Tournament> _tournaments = MockTournaments.getTodosOsTorneios();

  List<Catch> get catches => _catches;

  void addCatch(Catch fishCatches) {
    _catches.add(fishCatches);
    notifyListeners();
  }

  void updateCatch(Catch updatedCatch) {
    final index =
        _catches.indexWhere((fishCatches) => fishCatches.id == updatedCatch.id);
    if (index >= 0) {
      _catches[index] = updatedCatch;
      notifyListeners();
    }
  }

  void deleteCatch(String catchId) {
    _catches.removeWhere((fishCatches) => fishCatches.id == catchId);
    notifyListeners();
  }

  List<Catch> getCatchesByParticipant(Participant participant) {
    return _catches
        .where((fishCatches) => fishCatches.participant == participant)
        .toList();
  }

  List<Catch> getCatchesByTournament(Tournament tournament) {
    return _catches
        .where((fishCatches) => fishCatches.tournament == tournament)
        .toList();
  }

  List<Catch> getCatchesByValidationStatus(FishEvaluationStatus status) {
    return _catches
        .where((fishCatches) => fishCatches.fishEvaluationStatus == status)
        .toList();
  }

  List<Catch> getPendingCatchesByAdmin(User user) {
    List<Catch> pendingCatches = [];

    for (Tournament tournament in _tournaments) {
      bool isAdminOrModerator = false;

      // Verifica se o usuário é um administrador do torneio
      if (tournament.administrators == user) {
        isAdminOrModerator = true;
      }

      // Verifica se o usuário é um moderador do torneio
      if (!isAdminOrModerator && tournament.moderators != null) {
        if (tournament.moderators!.contains(user)) {
          isAdminOrModerator = true;
        }
      }

      if (isAdminOrModerator) {
        for (Catch fishCatch in tournament.catches!) {
          if (fishCatch.fishEvaluationStatus ==
                  FishEvaluationStatus.aguardandoAvaliacao &&
              fishCatch.validatingAdmin == null) {
            pendingCatches.add(fishCatch);
          }
        }
      }
    }

    return pendingCatches;
  }

  Catch getCatchById(String catchId) {
    return _catches.firstWhere((fishCatch) => fishCatch.id == catchId,
        orElse: () => MockCatches.createEmptyCatch('1', '1'));
  }
}
