import 'package:flutter/material.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/list_section_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/participant_card_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/ranking_card_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/tournament_header_widget.dart';

class TournamentAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administração de Torneio'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TournamentHeaderWidget(),
            SizedBox(height: 20),
            ListSectionWidget(
              title: 'Ranking',
              itemCount: 5,
              itemBuilder: (context, index) {
                return RankingCardWidget(rank: index + 1, index: index);
              },
            ),
            SizedBox(height: 20),
            ListSectionWidget(
              title: 'Lista de Participantes',
              itemCount: 10,
              itemBuilder: (context, index) {
                return ParticipantCardWidget(
                  participantName: 'Nome do Participante ${index + 1}',
                  participantCity: 'Teste ${index + 1}',
                  participantPhoto: 'caminho/para/a/foto_do_participante.jpg',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}