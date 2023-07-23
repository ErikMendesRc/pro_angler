import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/user.dart';

import '../enum/tournament_team_based.dart';

class Tournament {
  String id;
  String organizerName;
  UserData administrators;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  String location;
  String modality;
  String type;
  double entryFee;
  List<String> prizes;
  String status;
  TournamentTeamBased teamBased;
  String rules;
  bool isUserVerified;
  bool isTournamentVerified;
  bool isRegistered;
  List<String>? participatingUsers;
  List<UserData>? moderators;
  List<Catch>? catches;

  Tournament({
    required this.id,
    required this.organizerName,
    required this.administrators,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.modality,
    required this.type,
    required this.entryFee,
    required this.prizes,
    required this.status,
    required this.teamBased,
    required this.rules,
    required this.isUserVerified,
    this.isTournamentVerified = false,
    this.isRegistered = false,
    this.participatingUsers,
    this.moderators,
    this.catches,
  });

  Map<String, dynamic> toJson() {
    return {
      "organizerName": organizerName,
      "administrators": administrators.toJson(),
      "name": name,
      "description": description,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "location": location,
      "modality": modality,
      "type": type,
      "entryFee": entryFee,
      "prizes": prizes,
      "status": status,
      "teamBased": teamBased.toJson(),
      "rules": rules,
      "isUserVerified": isUserVerified,
      "isTournamentVerified": isTournamentVerified,
      "isRegistered": isRegistered,
    };
  }

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'],
      organizerName: json['organizerName'],
      administrators: UserData.fromJson(json['administrators']),
      name: json['name'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      location: json['location'],
      modality: json['modality'],
      type: json['type'],
      entryFee: json['entryFee'].toDouble(),
      prizes: List<String>.from(json['prizes']),
      status: json['status'],
      teamBased: _parseTournamentTeamBased(json['teamBased']),
      rules: json['rules'],
      isUserVerified: json['isUserVerified'],
      isTournamentVerified: json['isTournamentVerified'],
      isRegistered: json['isRegistered'],
    );
  }

  static TournamentTeamBased _parseTournamentTeamBased(String value) {
    switch (value) {
      case 'individual':
        return TournamentTeamBased.individual;
      case 'team':
        return TournamentTeamBased.equipe;
      default:
        throw ArgumentError("Invalid TournamentTeamBased value: $value");
    }
  }

  Tournament.empty()
      : id = '',
        organizerName = '',
        administrators = UserData.empty(),
        name = '',
        description = '',
        startDate = DateTime.now(),
        endDate = DateTime.now(),
        location = '',
        modality = '',
        type = '',
        entryFee = 0.0,
        prizes = [],
        status = '',
        teamBased = TournamentTeamBased.equipe,
        rules = '',
        isUserVerified = false,
        isTournamentVerified = false,
        isRegistered = false,
        participatingUsers = null,
        moderators = null,
        catches = null;
}
