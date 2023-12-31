import 'package:collection/collection.dart';
import '../Models/achiviement.dart';
import '../Models/team.dart';

class MockTeams {
  static List<Team> getAllTeams() {
    return [
      Team(
          id: '1',
          name: 'Os F.E.R.A',
          description: 'This is Team A',
          creationDate: DateTime.now(),
          participants: [
          ],
          achievements: [
            ChampionTrophys(
              userId: '',
              teamId: '1',
              id: '1',
              name: 'Campeão',
              description: 'Foi campeão',
              tournamentId: '2',
            ),
            ChampionTrophys(
              userId: '',
              teamId: '1',
              id: '2',
              name: 'Trabalho em Equipe',
              description: 'Melhor Equipe',
              tournamentId: '3',
            ),
          ],
          city: 'Rio Claro-SP',
          creatorId: '1',
          photo:
              'https://pps.whatsapp.net/v/t61.24694-24/341259005_2412805818889557_5350470179841899005_n.jpg?ccb=11-4&oh=01_AdQaPslGf2BNliQMg2QNkj_AMmnZSyNoGZ6ujk_kVHXirg&oe=64B96A2B'),
      Team(
        id: '2',
        name: 'Team B',
        description: 'This is Team B',
        creationDate: DateTime.now(),
        participants: [
        ],
        achievements: [
          ChampionTrophys(
            id: '3',
            teamId: '',
            name: 'Second Place',
            description: 'Segundo Lugar',
            tournamentId: '1',
          ),
        ],
        city: 'Araras-SP',
        creatorId: '3',
      ),
    ];
  }

  static List<Team> getTeamsForTournament(String tournamentId) {
    return [
      Team(
        id: '1',
        name: 'Team A',
        description: 'This is Team A',
        creationDate: DateTime.now(),
        participants: [
        ],
        achievements: [
          ChampionTrophys(
            id: '1',
            name: 'First Place',
            description: 'Primeiro Lugar',
            tournamentId: '2',
          ),
          ChampionTrophys(
            id: '2',
            name: 'Best Teamwork',
            description: 'Melhor Equipe',
            tournamentId: '3',
          ),
        ],
        city: 'Rio Claro-SP',
        creatorId: '1',
      ),
      Team(
        id: '2',
        name: 'Team B',
        description: 'This is Team B',
        creationDate: DateTime.now(),
        participants: [
        ],
        achievements: [
          ChampionTrophys(
            id: '3',
            name: 'Second Place',
            description: 'Segundo Lugar',
            tournamentId: '1',
          ),
        ],
        city: 'Araras-SP',
        creatorId: '3',
      ),
    ];
  }

  static List<Team> getTeamsByParticipantId(String participantId) {
  return getAllTeams().where((team) => team.getMembers().any((user) => user == participantId)).toList();
}

  static Team? getTeamByCreatorId(String creatorId) {
    return getAllTeams().firstWhereOrNull((team) => team.creatorId == creatorId);
  }

  static Team getTeamById(String teamId) {
    for (Team team in getAllTeams()) {
      if (team.id == teamId) {
        return team;
      }
    }
    // Caso não encontre a equipe, pode retornar null ou um objeto vazio
    return Team(
      id: '',
      name: '',
      description: '',
      creationDate: DateTime.now(),
      participants: [],
      achievements: [],
      city: '',
      creatorId: '',
    );
  }
}
