class Advertising {
  String id;
  String nome;
  String codigoPais;
  String telefone;
  String email;
  String site;
  String instagram;
  String imageUrl;
  String whatsapp;

  Advertising({
    required this.id,
    required this.nome,
    required this.codigoPais,
    required this.telefone,
    required this.email,
    required this.site,
    required this.instagram,
    required this.imageUrl,
    required this.whatsapp
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'codigoPais': codigoPais,
      'telefone': telefone,
      'email': email,
      'site': site,
      'instagram': instagram,
      'imageUrl': imageUrl,
      'whatsapp': whatsapp
    };
  }

  factory Advertising.fromJson(Map<String, dynamic> json) {
    return Advertising(
      id: json['id'],
      nome: json['nome'],
      codigoPais: json['codigoPais'],
      telefone: json['telefone'],
      email: json['email'],
      site: json['site'],
      instagram: json['instagram'],
      imageUrl: json['imageUrl'],
      whatsapp: json['whatsapp']
    );
  }
}