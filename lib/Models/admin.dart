import 'package:pro_angler/Models/torneios.dart';
import 'package:pro_angler/Models/user.dart';

class Admin {
  String id;
  Tournament tournament;
  User administrator;

  Admin({
    required this.id,
    required this.tournament,
    required this.administrator,
  });
}