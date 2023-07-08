import 'package:pro_angler/Models/user.dart';

class Tournament {
  String id;
  String organizerName;
  List<User>? administrators;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  String location;
  String modality;
  String type;
  double entryFee;
  List<String> prizes;
  String status;

  Tournament({
    required this.id,
    required this.organizerName,
    this.administrators,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.modality,
    required this.type,
    required this.entryFee,
    required this.prizes,
    required this.status
  });

}