import 'package:flutter/material.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/participant.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/enum/fish_evaluation_status.dart';

class CatchesProvider extends ChangeNotifier {
  late List<Catch> _catches = [];
  late List<Tournament> _tournaments = [];

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
      if (tournament.administrators?.contains(user) == true ||
          tournament.moderators?.contains(user) == true) {
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
}
