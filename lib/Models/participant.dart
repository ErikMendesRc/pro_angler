import 'package:pro_angler/Models/team.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

class Participant {
  String id;
  Tournament tournament;
  User participant;
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
}