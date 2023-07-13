import 'package:pro_angler/Models/personal_achievement.dart';
import 'package:pro_angler/Models/tournament.dart';

import 'achiviement.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String? photo;
  List<ChampionTrophys>? championTrophys;
  List<PersonalAchieviments>? personalAchiviements;
  List<Tournament>? myTournaments;
  String city;
  List<Tournament>? participatingTournaments;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.photo,
    this.championTrophys,
    this.myTournaments,
    required this.city,
    this.personalAchiviements,
    this.participatingTournaments,
  });
}