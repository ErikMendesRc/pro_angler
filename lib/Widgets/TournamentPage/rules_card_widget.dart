import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Providers/tournament_provider.dart';
import 'section_title_widget.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({super.key});

  @override
Widget build(BuildContext context) {
  final tournamentProvider = Provider.of<TournamentProvider>(context);

  return Card(
    color: CoresPersonalizada.corCards,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitleWidget('Regras e Regulamentos'),
          const SizedBox(height: 8),
          Text(
            tournamentProvider.currentTournament?.rules ?? '',
            style: CustomTextStyles.cardsTexts,
          ),
        ],
      ),
    ),
  );
}
}