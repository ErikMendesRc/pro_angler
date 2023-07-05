import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

class ChampionAchievement {
  String id;
  User user;
  Tournament tournament;
  DateTime date;

  ChampionAchievement({
    required this.id,
    required this.user,
    required this.tournament,
    required this.date,
  });
}