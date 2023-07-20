class ChampionTrophys {
  final String id;
  final String? teamId;
  final String? userId;
  final String name;
  final String description;
  final String tournamentId;
  final String? photo;

  ChampionTrophys(
      {
      this.teamId='',
      this.userId='',
      required this.id,
      required this.name,
      required this.description,
      required this.tournamentId,
      this.photo});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "teamId": teamId,
      "userId": userId,
      "name": name,
      "description": description,
      "tournamentId": tournamentId,
      "photo": photo,
    };
  }

  factory ChampionTrophys.fromJson(Map<String, dynamic> json) {
    return ChampionTrophys(
      id: json['id'],
      teamId: json['teamId'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      tournamentId: json['tournamentId'],
      photo: json['photo'],
    );
  }
}
