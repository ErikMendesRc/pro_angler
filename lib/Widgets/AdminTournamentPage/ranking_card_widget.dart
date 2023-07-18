import 'package:flutter/material.dart';

class RankingCardWidget extends StatelessWidget {
  final int rank;
  final int index;

  const RankingCardWidget({
    required this.rank,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('caminho/para/a/foto_do_participante.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: 50.0,
          height: 50.0,
        ),
        title: Text('Erik'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text('Nº de Inscrição: 12345'),
            SizedBox(height: 8.0),
            Text('Cidade: São Paulo'),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${rank}º Lugar',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text('Pts: 175.5cm'),
          ],
        ),
      ),
    );
  }
}