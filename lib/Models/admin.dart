import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';

class Admin {
  String id;
  Tournament tournament;
  UserData administrator;

  Admin({
    required this.id,
    required this.tournament,
    required this.administrator,
  });
}