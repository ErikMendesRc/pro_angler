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
  UserData? validatingAdmin;

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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "participant": participant.toJson(),
      "tournament": tournament.toJson(),
      "species": species,
      "size": size,
      "photo": photo,
      "video": video,
      "dateTime": dateTime.toIso8601String(),
      "fishEvaluationStatus": fishEvaluationStatus.toString(),
      "captureLocal": captureLocal,
      "description": description,
      "validatingAdmin": validatingAdmin != null ? validatingAdmin!.toJson() : null,
    };
  }

  factory Catch.fromJson(Map<String, dynamic> json) {
    return Catch(
      id: json['id'],
      participant: Participant.fromJson(json['participant']),
      tournament: Tournament.fromJson(json['tournament']),
      species: json['species'],
      size: json['size'],
      photo: json['photo'],
      video: json['video'],
      dateTime: DateTime.parse(json['dateTime']),
      fishEvaluationStatus: _parseFishEvaluationStatus(json['fishEvaluationStatus']),
      captureLocal: json['captureLocal'],
      description: json['description'],
      validatingAdmin: json['validatingAdmin'] != null ? UserData.fromJson(json['validatingAdmin']) : null,
    );
  }

  static FishEvaluationStatus _parseFishEvaluationStatus(String value) {
    switch (value) {
      case 'aguardandoAvaliacao':
        return FishEvaluationStatus.aguardandoAvaliacao;
      case 'validado':
        return FishEvaluationStatus.peixeValidado;
      case 'invalidado':
        return FishEvaluationStatus.peixeInvalidado;
      default:
        throw ArgumentError("Invalid FishEvaluationStatus value: $value");
    }
  }

  factory Catch.empty() {
  return Catch(
    id: '',
    participant: Participant.empty(),
    tournament: Tournament.empty(),
    species: '',
    size: 0,
    photo: '',
    video: '',
    dateTime: DateTime.now(),
    fishEvaluationStatus: FishEvaluationStatus.aguardandoAvaliacao,
    captureLocal: '',
    description: '',
    validatingAdmin: null,
  );
}

}
