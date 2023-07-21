import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/personal_achievement.dart';
import 'package:pro_angler/Models/tournament.dart';

import 'achiviement.dart';

class UserData {
  String id;
  String name;
  String email;
  String? photoURL;
  List<ChampionTrophys>? championTrophys;
  List<PersonalAchieviments>? personalAchiviements;
  List<Tournament>? myTournaments;
  String city;
  List<Tournament>? participatingTournaments;
  List<Catch>? myCatches;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    this.photoURL,
    this.championTrophys,
    this.myTournaments,
    required this.city,
    this.personalAchiviements,
    this.participatingTournaments,
    this.myCatches
  });


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "photoURL": photoURL,
      "championTrophys": championTrophys?.map((trophy) => trophy.toJson()).toList(),
      "personalAchiviements": personalAchiviements?.map((achievement) => achievement.toJson()).toList(),
      "myTournaments": myTournaments?.map((tournament) => tournament.toJson()).toList(),
      "city": city,
      "participatingTournaments": participatingTournaments?.map((tournament) => tournament.toJson()).toList(),
      "myCatches": myCatches?.map((catchs) => catchs.toJson()).toList(),
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoURL: json['photoURL'],
      championTrophys: _parseChampionTrophys(json['championTrophys']),
      personalAchiviements: _parsePersonalAchieviments(json['personalAchiviements']),
      myTournaments: _parseTournaments(json['myTournaments']),
      city: json['city'],
      participatingTournaments: _parseTournaments(json['participatingTournaments']),
      myCatches: _parseCatches(json['myCatches']),
    );
  }

  static List<ChampionTrophys>? _parseChampionTrophys(List<dynamic>? list) {
  if (list != null) {
    return list.map((item) => ChampionTrophys.fromJson(item as Map<String, dynamic>)).toList();
  }
  return null;
}


  static List<PersonalAchieviments>? _parsePersonalAchieviments(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => PersonalAchieviments.fromJson(item)).toList();
    }
    return null;
  }

  static List<Tournament>? _parseTournaments(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => Tournament.fromJson(item)).toList();
    }
    return null;
  }

  static List<Catch>? _parseCatches(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => Catch.fromJson(item)).toList();
    }
    return null;
  }

  UserData.empty()
      : id = '',
        name = '',
        email = '',
        photoURL = null,
        championTrophys = null,
        personalAchiviements = null,
        myTournaments = null,
        city = '',
        participatingTournaments = null,
        myCatches = null;
}