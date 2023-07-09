import 'package:pro_angler/Models/participant.dart';

import '../enum/fish_evaluation_status.dart';

class Catch {
  String id;
  Participant participant;
  String species;
  double size;
  String photo;
  String video;
  DateTime dateTime;
  FishEvaluationStatus fishEvaluationStatus;

  Catch({
    required this.id,
    required this.participant,
    required this.species,
    required this.size,
    required this.photo,
    required this.video,
    required this.dateTime,
    this.fishEvaluationStatus = FishEvaluationStatus.aguardandoAvaliacao,
  });
}
