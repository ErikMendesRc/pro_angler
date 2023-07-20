import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/participant.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Services/catch_service.dart';
import 'package:pro_angler/Services/tournament_service.dart';
import 'package:pro_angler/enum/fish_evaluation_status.dart';

class CatchesProvider extends ChangeNotifier {
  final CatchService _catchService = CatchService();
  final TournamentService _tournamentService = TournamentService();

  List<Catch> _catches = [];
  List<Tournament> _tournaments = [];

  List<Catch> get catches => _catches;

  Future<void> fetchCatches(String tournamentId) async {
    try {
      _catches = await _catchService.getCatchesByTournamentId(tournamentId);
      notifyListeners();
    } catch (e) {
      print('Falha ao buscar as capturas: $e');
    }
  }

  Future<void> addCatch(Catch fishCatch) async {
    try {
      await _catchService.createCatch(fishCatch);
      _catches.add(fishCatch);
      notifyListeners();
    } catch (e) {
      print('Falha ao adicionar a captura: $e');
    }
  }

  Future<void> updateCatch(Catch updatedCatch) async {
    try {
      await _catchService.updateCatch(updatedCatch);
      final index =
          _catches.indexWhere((fishCatch) => fishCatch.id == updatedCatch.id);
      if (index >= 0) {
        _catches[index] = updatedCatch;
        notifyListeners();
      }
    } catch (e) {
      print('Falha ao atualizar a captura: $e');
    }
  }

  Future<void> deleteCatch(String catchId) async {
    try {
      await _catchService.deleteCatch(catchId);
      _catches.removeWhere((fishCatch) => fishCatch.id == catchId);
      notifyListeners();
    } catch (e) {
      print('Falha ao excluir a captura: $e');
    }
  }

  Future<List<Catch>> getCatchesByParticipant(Participant participant) async {
    try {
      return await _catchService.getCatchesByParticipant(participant.id);
    } catch (e) {
      print('Falha ao buscar as capturas por participante: $e');
      return [];
    }
  }

  Future<List<Catch>> getCatchesByValidationStatus(
      FishEvaluationStatus status) async {
    try {
      return await _catchService.getCatchesByValidationStatus(status);
    } catch (e) {
      print('Falha ao buscar as capturas por status de validação: $e');
      return [];
    }
  }

  Future<List<Catch>> getPendingCatchesByAdmin(User user) async {
    try {
      _tournaments = await _tournamentService.getTournamentsByAdmin(user.uid);
      List<Catch> pendingCatches = [];

      for (Tournament tournament in _tournaments) {
        List<Catch> tournamentCatches =
            await _catchService.getCatchesByTournamentId(tournament.id);

        for (Catch fishCatch in tournamentCatches) {
          if (fishCatch.fishEvaluationStatus ==
                  FishEvaluationStatus.aguardandoAvaliacao &&
              fishCatch.validatingAdmin == null) {
            pendingCatches.add(fishCatch);
          }
        }
      }

      return pendingCatches;
    } catch (e) {
      print('Falha ao buscar as capturas pendentes por administrador: $e');
      return [];
    }
  }

  Future<Catch?> getCatchById(String catchId) async {
    try {
      return await _catchService.getCatchById(catchId);
    } catch (e) {
      print('Falha ao buscar a captura pelo ID: $e');
      return Catch.empty();
    }
  }

  Future<List<Catch>> getCatchesByUserId(String userId) async {
    try {
      return await _catchService.getCatchesByParticipant(userId);
    } catch (e) {
      print('Falha ao buscar as capturas por ID de usuário: $e');
      return [];
    }
  }

  Future<User?> _getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (e) {
      print('Falha ao obter o usuário atual: $e');
      return null;
    }
  }

  Future<List<Catch>> getPendingCatches() async {
    try {
      final pendingCatches = await _catchService.getCatchesByValidationStatus(
          FishEvaluationStatus.aguardandoAvaliacao);

      final currentUser = await _getCurrentUser();
      final userIsParticipant =
          _checkUserIsParticipant(currentUser, pendingCatches);

      if (!userIsParticipant) {
        for (Catch fishCatch in pendingCatches) {
          await _addParticipantToCatch(currentUser, fishCatch);
        }
      }

      return pendingCatches;
    } catch (e) {
      print('Falha ao buscar as capturas pendentes: $e');
      return [];
    }
  }

  Future<List<Catch>> getValidatedCatches() async {
    try {
      return await _catchService
          .getCatchesByValidationStatus(FishEvaluationStatus.peixeValidado);
    } catch (e) {
      print('Falha ao buscar as capturas válidas: $e');
      return [];
    }
  }

  Future<List<Catch>> getInvalidatedCatches() async {
    try {
      return await _catchService
          .getCatchesByValidationStatus(FishEvaluationStatus.peixeInvalidado);
    } catch (e) {
      print('Falha ao buscar as capturas inválidas: $e');
      return [];
    }
  }

  bool _checkUserIsParticipant(User? user, List<Catch> catches) {
    if (user == null) return false;

    final userId = user.uid;
    for (Catch fishCatch in catches) {
      if (fishCatch.participant.id.contains(userId)) {
        return true;
      }
    }

    return false;
  }

  Future<void> _addParticipantToCatch(User? user, Catch fishCatch) async {
    if (user == null) return;

    final userId = user.uid;
    if (fishCatch.participant.id != userId) {
      fishCatch.participant.id = userId;
      await _catchService.updateCatch(fishCatch);
    }
  }
}
