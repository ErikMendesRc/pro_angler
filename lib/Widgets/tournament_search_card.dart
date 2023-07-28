import 'package:flutter/material.dart';
import 'package:pro_angler/Models/tournament.dart';

class TournamentSearchCard extends StatelessWidget {
  final Tournament tournament;

  const TournamentSearchCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              tournament.imageUrl ?? '',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Text(
              tournament.name,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}