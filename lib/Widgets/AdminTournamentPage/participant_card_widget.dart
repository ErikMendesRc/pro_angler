import 'package:flutter/material.dart';

class ParticipantCardWidget extends StatelessWidget {
  final String participantName;
  final String participantCity;
  final String participantPhoto;

  const ParticipantCardWidget({
    required this.participantName,
    required this.participantCity,
    required this.participantPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(participantPhoto),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: 50.0,
          height: 50.0,
        ),
        title: Text(participantName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text('Cidade: $participantCity'),
          ],
        ),
        trailing: Text('Ver Perfil'),
      ),
    );
  }
}