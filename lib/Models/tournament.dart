import 'package:cloud_firestore/cloud_firestore.dart'; // necessário para o tipo Timestamp

import '../enum/tournament_team_based.dart';

class Tournament {
  String id;
  String organizerName;
  String administratorId;
  String name;
  String description;
  Timestamp startDate;
  Timestamp endDate;
  String location;
  String modality;
  String type;
  double? entryFee;
  String prizes;
  String status;
  TournamentTeamBased teamBased;
  String rules;
  bool isUserVerified;
  bool isTournamentVerified;
  bool isRegistered;
  List<String>? competitorsIds;
  List<String>? moderatorsIds;
  List<String>? catchesIds;
  String? imageUrl;

  Tournament({
    required this.id,
    required this.organizerName,
    required this.administratorId,
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
    this.competitorsIds,
    this.moderatorsIds,
    this.catchesIds,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "organizerName": organizerName,
      "administratorId": administratorId,
      "name": name,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
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
      'competitorsIds': competitorsIds,
      'moderatorsIds': moderatorsIds,
      'catchesIds': catchesIds,
      "imageUrl": imageUrl,
    };
  }

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'],
      organizerName: json['organizerName'],
      administratorId: json['administratorId'],
      name: json['name'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      location: json['location'],
      modality: json['modality'],
      type: json['type'],
      entryFee: json['entryFee'].toDouble(),
      prizes: json['prizes'],
      status: json['status'],
      teamBased: _parseTournamentTeamBased(json['teamBased']),
      rules: json['rules'],
      isUserVerified: json['isUserVerified'],
      isTournamentVerified: json['isTournamentVerified'],
      isRegistered: json['isRegistered'],
      competitorsIds: json['competitorsIds'],
      moderatorsIds: json['moderatorsIds'],
      catchesIds: json['catchesIds'],
      imageUrl: json['imageUrl'],
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
        administratorId = '',
        name = '',
        description = '',
        startDate = Timestamp.now(),
        endDate = Timestamp.now(),
        location = '',
        modality = '',
        type = '',
        entryFee = 0.0,
        prizes = '',
        status = '',
        teamBased = TournamentTeamBased.equipe,
        rules = '',
        isUserVerified = false,
        isTournamentVerified = false,
        isRegistered = false,
        competitorsIds = null,
        moderatorsIds = null,
        catchesIds = null,
        imageUrl = '';
}
