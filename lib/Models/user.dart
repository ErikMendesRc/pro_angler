import 'package:pro_angler/Models/tournament.dart';

import 'achiviement.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String? photo;
  List<Achievement>? achievements;
  List<Tournament>? myTournaments;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.photo,
    this.achievements,
    this.myTournaments
  });
}