import 'package:pro_angler/Models/user.dart';

class Tournament {
  String id;
  User organizer;
  List<User> administrators;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  String location;
  String modality;
  String type;
  double entryFee;
  List<String> prizes;

  Tournament({
    required this.id,
    required this.organizer,
    required this.administrators,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.modality,
    required this.type,
    required this.entryFee,
    required this.prizes,
  });
}