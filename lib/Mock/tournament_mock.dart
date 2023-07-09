import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/participant.dart';
import 'package:pro_angler/Models/team.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/enum/tournament_team_based.dart';

class MockData {

  
  static List<Tournament> getTodosOsTorneios() {
    
    return [
      Tournament(
        id: '1',
        organizerName: 'Erik Mendes',
        name: 'Tucuna ProAngler',
        description: 'Torneio teste no aplicativo',
        startDate: DateTime(2023, 7, 10),
        endDate: DateTime(2023, 7, 15),
        location: 'Araras-SP',
        modality: 'Barcos',
        type: 'Online',
        entryFee: 100.0,
        prizes: ['Prêmio 1', 'Prêmio 2'],
        status: 'Em Andamento',
        teamBased: TournamentTeamBased.Equipe,
        rules: 'Regras do torneio 1',
        isUserVerified: true,
        isTournamentVerified: true
      ),
      Tournament(
        id: '2',
        organizerName: 'Fernando',
        name: 'Fer Iscas',
        description: 'Entre Amigos',
        startDate: DateTime(2023, 7, 01),
        endDate: DateTime(2023, 7, 03),
        location: 'Planura-MG',
        modality: 'Caiaque',
        type: 'Presencial',
        entryFee: 75.0,
        prizes: ['Prêmio 3', 'Prêmio 4'],
        status: 'Finalizado',
        teamBased: TournamentTeamBased.Individual,
        rules: 'Regras do torneio 2',
        isUserVerified: true,
        isTournamentVerified: true
      ),
      Tournament(
        id: '3',
        organizerName: 'Marcio',
        name: 'Tucuna Free',
        description: 'Maior torneio de pesca do brasil.',
        startDate: DateTime(2023, 7, 10),
        endDate: DateTime(2023, 7, 15),
        location: 'Santa fé do sul',
        modality: 'Barco',
        type: 'Presencial',
        entryFee: 1500.0,
        prizes: ['1 Barco + 1000,00'],
        status: 'Em Andamento',
        teamBased: TournamentTeamBased.Equipe,
        rules: 'Regras do torneio 3',
        isUserVerified: true,
        isTournamentVerified: true
      ),
      Tournament(
        id: '4',
        organizerName: 'Zé',
        name: 'Amigos do Tarumã',
        description: 'Torneio valendo vaga copa brasil',
        startDate: DateTime(2023, 7, 20),
        endDate: DateTime(2023, 7, 25),
        location: 'Manaus-AM',
        modality: 'Barco/Caiaque',
        type: 'Presencial',
        entryFee: 250.0,
        prizes: ['Barco + Vaga Copa Brasil'],
        status: 'Em Andamento',
        teamBased: TournamentTeamBased.Equipe,
        rules: 'Regras do torneio 4',
        isUserVerified: true,
        isTournamentVerified: true
      ),
      Tournament(
        id: '5',
        organizerName: 'Organizador 5',
        name: 'Torneio 5',
        description: 'Descrição do torneio 5',
        startDate: DateTime(2023, 8, 1),
        endDate: DateTime(2023, 8, 5),
        location: 'Local 5',
        modality: 'Modalidade 5',
        type: 'Tipo 5',
        entryFee: 75.0,
        prizes: ['Prêmio 5A', 'Prêmio 5B'],
        status: 'Planejado',
        teamBased: TournamentTeamBased.Individual,
        rules: 'Regras do torneio 5',
        isUserVerified: false,
        isTournamentVerified: false
      ),
    ];
  }

  static List<Tournament> getTorneiosEmAndamento() {
    return [
      Tournament(
        id: '1',
        organizerName: 'Organizador 3',
        name: 'Torneio 1',
        description: 'Descrição do torneio 1',
        startDate: DateTime(2023, 7, 10),
        endDate: DateTime(2023, 7, 15),
        location: 'Local 1',
        modality: 'Modalidade 1',
        type: 'Tipo 1',
        entryFee: 50.0,
        prizes: ['Prêmio 1A', 'Prêmio 1B'],
        status: 'Em Andamento',
        teamBased: TournamentTeamBased.Equipe,
        rules: 'Regras do torneio 5',
        isUserVerified: false,
        isTournamentVerified: false
      ),
      Tournament(
        id: '2',
        organizerName: 'Organizador 2',
        name: 'Torneio 4',
        description: 'Descrição do torneio 2',
        startDate: DateTime(2023, 7, 20),
        endDate: DateTime(2023, 7, 25),
        location: 'Local 2',
        modality: 'Modalidade 2',
        type: 'Tipo 2',
        entryFee: 75.0,
        prizes: ['Prêmio 2A', 'Prêmio 2B'],
        status: 'Em Andamento',
        teamBased: TournamentTeamBased.Equipe,
        rules: 'Regras do torneio 6',
        isUserVerified: false,
        isTournamentVerified: false
      ),
    ];
  }

  
  static List<Participant> getParticipantsForTournament(String tournamentId) {
    Tournament tournament = getTournamentById(tournamentId);
    return [
      Participant(
        id: '1',
        tournament: tournament,
        participant: User(id: '1', name: 'John Doe', email: 'john@example.com', password: 'password'),
        team: null,
        status: 'Enviou capturas',
      ),
      Participant(
        id: '2',
        tournament: tournament,
        participant: User(id: '2', name: 'Jane Smith', email: 'jane@example.com', password: 'password'),
        team: Team(id: '1', name: 'Team A', participants: []),
        status: 'Aguardando avaliação',
      ),
    ];
  }
  
  static List<Team> getTeamsForTournament(String tournamentId) {
    return [
      Team(
        id: '1',
        name: 'Team A',
        participants: [
          User(id: '1', name: 'John Doe', email: 'john@example.com', password: 'password'),
          User(id: '2', name: 'Jane Smith', email: 'jane@example.com', password: 'password'),
        ],
      ),
      Team(
        id: '2',
        name: 'Team B',
        participants: [
          User(id: '3', name: 'Bob Johnson', email: 'bob@example.com', password: 'password'),
          User(id: '4', name: 'Alice Brown', email: 'alice@example.com', password: 'password'),
        ],
      ),
    ];
  }
  
  static List<Catch> getCatchesForTournament(String tournamentId) {
    Tournament tournament = getTournamentById(tournamentId);

    return [
      Catch(
        id: '1',
        participant: Participant(
          id: '1',
          tournament: tournament,
          participant: User(id: '1', name: 'John Doe', email: 'john@example.com', password: 'password'),
          team: null,
          status: 'Enviou capturas',
        ),
        species: 'Bass',
        size: 12.5,
        photo: 'photo1.jpg',
        video: 'video1.mp4',
        dateTime: DateTime.now(),
        evaluationStatus: 'Aguardando Avaliação',
      ),
      Catch(
        id: '2',
        participant: Participant(
          id: '2',
          tournament: tournament,
          participant: User(id: '2', name: 'Jane Smith', email: 'jane@example.com', password: 'password'),
          team: Team(id: '1', name: 'Team A', participants: []),
          status: 'Aguardando avaliação',
        ),
        species: 'Trout',
        size: 10.2,
        photo: 'photo2.jpg',
        video: 'video2.mp4',
        dateTime: DateTime.now(),
        evaluationStatus: 'Validado',
      ),
    ];
  }

  static Tournament getTournamentById(String tournamentId) {
    for (Tournament tournament in getTodosOsTorneios()) {
      if (tournament.id == tournamentId) {
        return tournament;
      }
    }
    // Caso não encontre o torneio, pode retornar null ou um objeto vazio
    return Tournament(
      id: '',
      organizerName: '',
      name: '',
      description: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      location: '',
      modality: '',
      type: '',
      entryFee: 0.0,
      prizes: [],
      status: '',
      teamBased: TournamentTeamBased.Equipe,
      rules: '',
      isUserVerified: false,
      isTournamentVerified: false
    );
  }
}
