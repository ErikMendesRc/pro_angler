import 'package:pro_angler/Mock/tournament_mock.dart';

import '../Models/catch.dart';
import '../Models/tournament.dart';
import '../enum/fish_evaluation_status.dart';
import 'mock_participants.dart';
import 'mock_users.dart';

class MockCatches {
  static List<Catch> getCatchesForTournament(String tournamentId) {
    Tournament tournament = MockTournaments.getTournamentById(tournamentId);

    return [
      Catch(
        id: '1',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[0],
        species: 'Bass',
        size: 12.5,
        photo: 'https://www.fishtv.com/uploads/noticias/principal/400x300/captura-de-tela-2022-03-30-as-11-38-08-min.png',
        video: 'video1.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.aguardandoAvaliacao,
        captureLocal: 'Planura-MG',
        description: '',
        tournament: tournament,
        validatingAdmin: MockUsers.getUserById('2')
      ),
      Catch(
        id: '2',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[1],
        species: 'Trout',
        size: 10.2,
        photo: 'https://www.turmadobigua.com.br/fotos/2015/SIRN_81.JPG',
        video: 'video2.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.peixeValidado,
        captureLocal: 'Pres. Epitácio-SP',
        description: '',
        tournament: tournament,
        validatingAdmin: MockUsers.getUserById('1')
      ),
      Catch(
        id: '2',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[1],
        species: 'Trout',
        size: 10.2,
        photo: 'https://www.turmadobigua.com.br/forum/uploads/monthly_2016_12/IMG-20161212-WA0089.jpg.d6e1ecc471579be11f529c0d4fba17d4.jpg',
        video: 'video2.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.peixeInvalidado,
        captureLocal: 'Presidente Epitácio-SP',
        description: '',
        tournament: tournament,
        validatingAdmin: MockUsers.getUserById('1')
      ),
      Catch(
        id: '4',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[0],
        species: 'Bass',
        size: 12.5,
        photo: 'https://www.fishtv.com/uploads/noticias/principal/400x300/captura-de-tela-2022-03-30-as-11-38-08-min.png',
        video: 'video1.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.aguardandoAvaliacao,
        captureLocal: 'Planura-MG',
        description: '',
        tournament: tournament,
        validatingAdmin: MockUsers.getUserById('2')
      ),
      Catch(
        id: '5',
        participant: MockParticipants.getParticipantsForTournament(tournamentId)[0],
        species: 'Bass',
        size: 12.5,
        photo: 'https://www.fishtv.com/uploads/noticias/principal/400x300/captura-de-tela-2022-03-30-as-11-38-08-min.png',
        video: 'video1.mp4',
        dateTime: DateTime.now(),
        fishEvaluationStatus: FishEvaluationStatus.aguardandoAvaliacao,
        captureLocal: 'Planura-MG',
        description: '',
        tournament: tournament,
        validatingAdmin: MockUsers.getUserById('2')
      ),
    ];
  }
}