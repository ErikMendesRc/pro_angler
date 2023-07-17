import 'package:pro_angler/Models/participant.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

import '../enum/fish_evaluation_status.dart';

class Catch {
  String id;
  Participant participant;
  Tournament tournament;
  String species;
  double size;
  String photo;
  String video;
  DateTime dateTime;
  FishEvaluationStatus fishEvaluationStatus;
  String captureLocal;
  String description;
  User? validatingAdmin;

  Catch({
    required this.id,
    required this.participant,
    required this.species,
    required this.size,
    required this.photo,
    required this.video,
    required this.dateTime,
    this.fishEvaluationStatus = FishEvaluationStatus.aguardandoAvaliacao,
    required this.captureLocal,
    required this.description,
    required this.tournament,
    this.validatingAdmin
  });
}
