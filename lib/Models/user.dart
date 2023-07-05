import 'achiviement.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String photo;
  List<Achievement> achievements;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.photo,
    required this.achievements,
  });
}