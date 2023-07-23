import 'package:cloud_firestore/cloud_firestore.dart';

import 'achiviement.dart';

class Team {
  String id;
  String name;
  String description;
  DateTime creationDate;
  List<String> participants;
  List<ChampionTrophys> achievements;
  String city;
  String creatorId;
  String? photo;

  Team(
      {required this.id,
      required this.name,
      this.description = '',
      required this.creationDate,
      required this.participants,
      this.achievements = const [],
      required this.city,
      required this.creatorId,
      this.photo});

  List<String> getMembers() {
    return participants;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "creationDate": creationDate.toIso8601String(),
      "participants": participants,
      "achievements": achievements.map((trophy) => trophy.toJson()).toList(),
      "city": city,
      "creatorId": creatorId,
      "imageUrl": photo,
    };
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      creationDate: _parseTimestamp(json['creationDate']),
      participants: List<String>.from(json['participants'] ?? []),
      achievements: _parseChampionTrophys(json['achievements'] ?? []),
      city: json['city'] ?? '',
      creatorId: json['creatorId'] ?? '',
      photo: json['imageUrl'] ?? '',
    );
  }

  static DateTime _parseTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate() ?? DateTime.now();
  }

  static List<ChampionTrophys> _parseChampionTrophys(List<dynamic>? list) {
    if (list != null) {
      return list.map((item) => ChampionTrophys.fromJson(item)).toList();
    }
    return [];
  }
}
