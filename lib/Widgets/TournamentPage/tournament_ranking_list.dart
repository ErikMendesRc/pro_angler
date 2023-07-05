import 'package:flutter/material.dart';

class TournamentRankingWidget extends StatelessWidget {
  const TournamentRankingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('1')),
            title: Text('Participante 1'),
            trailing: Text('Pontuação: 100'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('2')),
            title: Text('Participante 2'),
            trailing: Text('Pontuação: 90'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('3')),
            title: Text('Participante 3'),
            trailing: Text('Pontuação: 80'),
          ),
        ),
        // Adicione mais participantes no ranking
      ],
    );
  }
}