import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Providers/tournament_provider.dart';

class RulesSection extends StatelessWidget {
  const RulesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);
    final tournament = tournamentProvider.currentTournament;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Regras:',
          style: CustomTextStyles.texto16Bold,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(tournament?.rules ?? '',
            style: CustomTextStyles.texto12Branco,)
          ]
          
        ),
      ],
    );
  }
}

