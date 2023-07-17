import 'package:pro_angler/Mock/tournament_mock.dart';

import '../Models/participant.dart';
import '../Models/tournament.dart';
import 'mock_teams.dart';
import 'mock_users.dart';

class MockParticipants {
  static List<Participant> getParticipantsForTournament(String tournamentId) {
    Tournament tournament = MockTournaments.getTournamentById(tournamentId);
    return [
      Participant(
        id: '1',
        tournament: tournament,
        participant: MockUsers.getUserById('1'),
        team: null,
      ),
      Participant(
        id: '2',
        tournament: tournament,
        participant: MockUsers.getUserById('2'),
        team: MockTeams.getTeamById('1'),
      ),
    ];
  }
}