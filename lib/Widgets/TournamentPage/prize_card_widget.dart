import 'package:flutter/material.dart';
import 'package:pro_angler/Widgets/TournamentPage/section_title_widget.dart';
import 'package:provider/provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import '../../Util/custom_styles.dart';

class PrizesCard extends StatelessWidget {
  const PrizesCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget('Prêmios e Reconhecimento'),
            const SizedBox(height: 8),
            Consumer<TournamentProvider>(
              builder: (context, tournamentProvider, _) {
                final tournaments = tournamentProvider.tournaments;
                final currentTournament = tournamentProvider.currentTournament;

                if (tournaments != null && tournaments.isNotEmpty) {
                  final currentTournamentPrizes = currentTournament != null
                      ? currentTournament.prizes
                      : [];

                  if (currentTournamentPrizes.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: currentTournamentPrizes.map((prize) => Text(
                        prize.toString(),
                        style: CustomTextStyles.cardsTexts,
                      )).toList(),
                    );
                  } else {
                    return const Text('Nenhuma Premiação');
                  }
                } else {
                  return const Text('Nenhuma Premiação');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}