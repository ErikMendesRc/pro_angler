import 'package:pro_angler/Models/capturas.dart';

class ParticipantesModel {
  String id;
  String nome;
  String informacoesPescador;
  bool statusInscricao;
  List<CapturasModel> capturas;

  ParticipantesModel({
    required this.id,
    required this.nome,
    required this.informacoesPescador,
    required this.statusInscricao,
    required this.capturas,
  });
}