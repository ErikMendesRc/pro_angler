enum TournamentTeamBased {
  equipe,
  individual,
}

extension TournamentTeamBasedExtension on TournamentTeamBased {
  String toJson() {
    switch (this) {
      case TournamentTeamBased.individual:
        return 'individual';
      case TournamentTeamBased.equipe:
        return 'team';
      default:
        throw Exception("Invalid TournamentTeamBased value: $this");
    }
  }
}