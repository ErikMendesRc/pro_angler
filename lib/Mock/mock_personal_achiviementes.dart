import '../Models/personal_achievement.dart';

class MockPersonalAchievements {
  static List<PersonalAchieviments> getAllPersonalAchievements() {
    return [
      PersonalAchieviments(
        id: '1',
        userId: '',
        tournamentId: '1',
        name: "Azarado",
        description: "Ficou em 2 lugar 10 vezes",
        photo: 'assets/images/conquistas/trevo.png'
      ),
      PersonalAchieviments(
        id: '2',
        userId: '',
        tournamentId: '1',
        name: "Entusiasta",
        description: "Participou de 10 torneios ou mais",
        photo: 'assets/images/conquistas/entusiasta.png'
      ),
      PersonalAchieviments(
        id: '3',
        userId: '',
        tournamentId: '1',
        name: "Sem rumo",
        description: "Foi em torneios de 5 cidades diferentes",
        photo: 'assets/images/conquistas/semrumo.png'
      ),
    ];
  }
}