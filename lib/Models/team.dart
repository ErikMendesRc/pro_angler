import 'package:pro_angler/Models/user.dart';

import 'achiviement.dart';

class Team {
  String id;
  String name;
  String description;
  DateTime creationDate;
  List<UserData> participants;
  List<ChampionTrophys> achievements;
  String city;
  String creatorId; 
  String? photo;

  Team({
    required this.id,
    required this.name,
    this.description = '',
    required this.creationDate,
    required this.participants,
    this.achievements = const [],
    required this.city,
    required this.creatorId,
    required captain,
    this.photo
  });

  List<UserData> getMembers() {
    return participants;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "creationDate": creationDate.toIso8601String(),
      "participants": participants.map((user) => user.toJson()).toList(),
      "achievements": achievements.map((trophy) => trophy.toJson()).toList(),
      "city": city,
      "creatorId": creatorId,
      "photo": photo,
    };
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      creationDate: DateTime.parse(json['creationDate']),
      participants: _parseParticipants(json['participants']),
      achievements: _parseChampionTrophys(json['achievements']),
      city: json['city'],
      creatorId: json['creatorId'],
      photo: json['photo'],
      captain: json['captain'],
    );
  }

  static List<UserData> _parseParticipants(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => UserData.fromJson(item)).toList();
    }
    return [];
  }

  static List<ChampionTrophys> _parseChampionTrophys(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => ChampionTrophys.fromJson(item)).toList();
    }
    return [];
  }
}
