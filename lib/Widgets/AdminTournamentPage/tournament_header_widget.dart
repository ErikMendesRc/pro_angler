import 'package:flutter/material.dart';

class TournamentHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(''),
          maxRadius: 50,
          minRadius: 50,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CIP 2023',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Total de Participantes: 10',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Organizador: Moreno',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}