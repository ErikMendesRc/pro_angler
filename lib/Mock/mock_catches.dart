import 'package:pro_angler/Mock/tournament_mock.dart';

import '../Models/catch.dart';
import '../Models/tournament.dart';
import '../enum/fish_evaluation_status.dart';
import 'mock_participants.dart';

class MockCatches {
  static List<Catch> getCatchesForTournament(String tournamentId) {
    Tournament tournament = MockTournaments.getTournamentById(tournamentId);

    return [
      Catch(
        id: '1',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[0],
        species: 'Bass',
        size: 12.5,
        photo: 'photo1.jpg',
        video: 'video1.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.aguardandoAvaliacao,
      ),
      Catch(
        id: '2',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[1],
        species: 'Trout',
        size: 10.2,
        photo: 'photo2.jpg',
        video: 'video2.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.peixeValidado,
      ),
    ];
  }
}