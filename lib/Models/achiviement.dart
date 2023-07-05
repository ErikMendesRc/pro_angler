class Achievement {
  final String id;
  final String name;
  final String description;
  final DateTime date;
  final String tournamentId;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.tournamentId,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      tournamentId: json['tournamentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
      'tournamentId': tournamentId,
    };
  }
}