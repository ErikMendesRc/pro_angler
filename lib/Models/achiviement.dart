class Achievement {
  final String id;
  final String name;
  final String description;
  final String tournamentId;
  final String? photo;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.tournamentId,
    this.photo
  });
}