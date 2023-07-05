import 'package:pro_angler/Models/participantes.dart';

class CapturasModel {
  String id;
  ParticipantesModel participante;
  String especie;
  double tamanho;
  double peso;
  String foto;
  DateTime dataHoraCaptura;

  CapturasModel({
    required this.id,
    required this.participante,
    required this.especie,
    required this.tamanho,
    required this.peso,
    required this.foto,
    required this.dataHoraCaptura,
  });
}