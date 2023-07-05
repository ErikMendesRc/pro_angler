import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

import 'section_title_widget.dart';
import 'tournament_ranking_list.dart';

class TournamentRankingCard extends StatelessWidget {
  const TournamentRankingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitleWidget('Ranking do Torneio'),
            SizedBox(height: 8),
            TournamentRankingWidget(),
          ],
        ),
      ),
    );
  }
}