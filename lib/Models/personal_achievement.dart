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
}