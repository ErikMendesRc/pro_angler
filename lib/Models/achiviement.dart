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
}
