import 'package:pro_angler/Models/team.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

class Participant {
  String id;
  Tournament tournament;
  UserData participant;
  Team? team;
  String? registrationNumber;
  String? totalScore;


  Participant({
    required this.id,
    required this.tournament,
    required this.participant,
    this.team,
    this.registrationNumber,
    this.totalScore
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tournament": tournament.toJson(),
      "participant": participant.toJson(),
      "team": team != null ? team!.toJson() : null,
      "registrationNumber": registrationNumber,
      "totalScore": totalScore,
    };
  }

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      tournament: Tournament.fromJson(json['tournament']),
      participant: UserData.fromJson(json['participant']),
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
      registrationNumber: json['registrationNumber'],
      totalScore: json['totalScore'],
    );
  }

  factory Participant.empty() {
    return Participant(
      id: '',
      tournament: Tournament.empty(),
      participant: UserData.empty(),
      team: null,
      registrationNumber: null,
      totalScore: null,
    );
  }
}