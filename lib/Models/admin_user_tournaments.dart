import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

import '../enum/tournament_team_based.dart';

class TournamentAdmin extends Tournament {
  TournamentAdmin({
    required String id,
    required String organizerName,
    required UserData administrators,
    required String name,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String modality,
    required String type,
    required double entryFee,
    required List<String> prizes,
    required String status,
    required TournamentTeamBased teamBased,
    required String rules,
    required bool isUserVerified,
    required bool isTournamentVerified,
    required bool isRegistered,
  }) : super(
          id: id,
          organizerName: organizerName,
          administrators: administrators,
          name: name,
          description: description,
          startDate: startDate,
          endDate: endDate,
          location: location,
          modality: modality,
          type: type,
          entryFee: entryFee,
          prizes: prizes,
          status: status,
          teamBased: teamBased,
          rules: rules,
          isUserVerified: isUserVerified,
          isTournamentVerified: isTournamentVerified,
          isRegistered: isRegistered,
        );
}