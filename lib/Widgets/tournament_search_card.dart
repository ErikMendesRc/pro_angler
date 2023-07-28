import 'package:flutter/material.dart';
import 'package:pro_angler/Models/tournament.dart';

class TournamentSearchCard extends StatelessWidget {
  final Tournament tournament;

  const TournamentSearchCard(this.tournament, {super.key});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Icon statusIcon;
    String statusText;
    switch (tournament.status.toLowerCase()) {
      case 'aguardando':
        statusColor = Colors.white;
        statusIcon = const Icon(Icons.alarm, color: Colors.blue);
        statusText = 'Aguardando';
        break;
      case 'em andamento':
        statusColor = Colors.white;
        statusIcon = const Icon(Icons.schedule, color: Colors.grey);
        statusText = 'Em Andamento';
        break;
      case 'finalizado':
        statusColor = Colors.white;
        statusIcon = const Icon(Icons.close, color: Colors.red);
        statusText = 'Finalizado';
        break;
      default:
        statusColor = Colors.transparent;
        statusIcon = const Icon(Icons.error, color: Colors.transparent);
        statusText = 'Indefinido';
    }

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(tournament.imageUrl ?? ''),
        ),
        title: Text(tournament.name),
        onTap: () {
          Navigator.pushNamed(context, '/tournamentpage');
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: statusColor,
              ),
              child: statusIcon,
            ),
            const SizedBox(width: 4),
            Text(statusText),
          ],
        ),
      ),
    );
  }
}
