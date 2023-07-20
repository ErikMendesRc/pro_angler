class PersonalAchieviments {
  final String id;
  final String tournamentId;
  final String name;
  final String description;
  String? userId;
  String? photo;

  PersonalAchieviments({
    required this.id,
    required this.name,
    required this.tournamentId,
    required this.description,
    this.userId='',
    this.photo=''
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tournamentId": tournamentId,
      "name": name,
      "description": description,
      "userId": userId,
      "photo": photo,
    };
  }

  factory PersonalAchieviments.fromJson(Map<String, dynamic> json) {
    return PersonalAchieviments(
      id: json['id'],
      tournamentId: json['tournamentId'],
      name: json['name'],
      description: json['description'],
      userId: json['userId'],
      photo: json['photo'],
    );
  }
}