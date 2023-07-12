import '../Models/achiviement.dart';

class MockChampionTrophys {
  static List<ChampionTrophys> getAllChampionTrophys() {
    return [
      ChampionTrophys(
        id: '2',
        userId: '3',
        name: 'Campeão',
        description: 'Venceu o ',
        tournamentId: '1',
        photo: 'assets/images/trofeus/trofeu.png'
      ),
      ChampionTrophys(
        id: '1',
        userId: '3',
        name: 'Peixaria',
        description: 'Maior quantidade de peixes no ',
        tournamentId: '1',
        photo: 'assets/images/trofeus/peixaria.png'
      ),
    ];
  }
}