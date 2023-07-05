class TorneiosModel {
  String id;
  String nome;
  DateTime data;
  Duration duracao;
  String localizacao;
  String regras;
  double taxaInscricao;
  String premios;
  String tipo;

  TorneiosModel({
    required this.id,
    required this.nome,
    required this.data,
    required this.duracao,
    required this.localizacao,
    required this.regras,
    required this.taxaInscricao,
    required this.premios,
    required this.tipo,
  });
}