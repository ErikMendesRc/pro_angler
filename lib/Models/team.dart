import 'package:pro_angler/Models/user.dart';

import 'achiviement.dart';

class Team {
  String id;
  String name;
  String description;
  DateTime creationDate;
  List<User> participants;
  List<Achievement> achievements;
  String city;
  String creatorId; 
  String? photo;// Propriedade para armazenar o ID do usuário criador

  Team({
    required this.id,
    required this.name,
    this.description = '',
    required this.creationDate,
    required this.participants,
    this.achievements = const [],
    required this.city,
    required this.creatorId,
    required captain,
    this.photo
  });

  List<User> getMembers() {
    return participants;
  }
}
