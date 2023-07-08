import 'package:pro_angler/Models/tournament.dart';

class MockData {
  static List<Tournament> getTodosOsTorneios() {
    return [
      Tournament(
        id: '1',
        organizerName: 'Erik Mendes', // Atualizado para o nome do organizador
        name: 'Tucuna ProAngler',
        description: 'Torneio teste no aplicativo',
        startDate: DateTime(2023, 7, 10),
        endDate: DateTime(2023, 7, 15),
        location: 'Araras-SP',
        modality: 'Caiaque',
        type: 'Online',
        entryFee: 100.0,
        prizes: ['Prêmio 1', 'Prêmio 2'],
        status: 'Em Andamento',
      ),
      Tournament(
        id: '2',
        organizerName: 'Fernando', // Atualizado para o nome do organizador
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
      ),
      Tournament(
        id: '3',
        organizerName: 'Organizador 3', // Atualizado para o nome do organizador
        name: 'Torneio 1',
        description: 'Descrição do torneio 1',
        startDate: DateTime(2023, 7, 10),
        endDate: DateTime(2023, 7, 15),
        location: 'Local 1',
        modality: 'Modalidade 1',
        type: 'Tipo 1',
        entryFee: 50.0,
        prizes: ['Prêmio 5', 'Prêmio 6'],
        status: 'Em Andamento',
      ),
      Tournament(
        id: '4',
        organizerName: 'Organizador 4', // Atualizado para o nome do organizador
        name: 'Torneio 4',
        description: 'Descrição do torneio 2',
        startDate: DateTime(2023, 7, 20),
        endDate: DateTime(2023, 7, 25),
        location: 'Local 2',
        modality: 'Modalidade 2',
        type: 'Tipo 2',
        entryFee: 75.0,
        prizes: ['Prêmio 7', 'Prêmio 7'],
        status: 'Em Andamento',
      ),
    ];
  }

  static List<Tournament> getTorneiosEmAndamento() {
    return [
      Tournament(
        id: '1',
        organizerName: 'Organizador 3', // Atualizado para o nome do organizador
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
      ),
      Tournament(
        id: '2',
        organizerName: 'Organizador 2', // Atualizado para o nome do organizador
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
      ),
    ];
  }
}