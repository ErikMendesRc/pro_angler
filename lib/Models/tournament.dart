import 'package:pro_angler/Models/catch.dart';
import 'package:pro_angler/Models/user.dart';

import '../enum/tournament_team_based.dart';

class Tournament {
  String id;
  String organizerName;
  List<User>? administrators;
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
  List<User>? moderators;
  List<Catch>? catches;

  Tournament({
    required this.id,
    required this.organizerName,
    this.administrators,
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
    this.catches
  });

}