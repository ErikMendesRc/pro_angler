import 'package:pro_angler/Models/user.dart';

class Team {
  String id;
  String name;
  List<User> participants;

  Team({
    required this.id,
    required this.name,
    required this.participants,
  });
}