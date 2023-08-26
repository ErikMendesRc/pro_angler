class Estado {
  final int id;
  final String sigla;
  final String nome;

  Estado({required this.id, required this.sigla, required this.nome});

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      id: json['id'],
      sigla: json['sigla'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }
}