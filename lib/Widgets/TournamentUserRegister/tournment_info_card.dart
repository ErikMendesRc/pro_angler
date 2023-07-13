import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../Providers/tournament_provider.dart';

class TournamentInfoCard extends StatelessWidget {
  const TournamentInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);
    final tournament = tournamentProvider.currentTournament;

    final dateFormat = DateFormat('dd/MM/yyyy');
    final currencyFormat = NumberFormat.currency(
      symbol: 'R\$',
      decimalDigits: 2,
      locale: 'pt_BR',
    );

    return Card(
      color: CoresPersonalizada.corPrimaria,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events, color: CoresPersonalizada.white),
                const SizedBox(width: 8),
                const Text(
                  'Torneio:',
                  style: CustomTextStyles.texto16Normal,
                ),
                const Spacer(),
                Text(
                  tournament?.name ?? '',
                  style: CustomTextStyles.texto16Normal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: CoresPersonalizada.white),
                const SizedBox(width: 8),
                const Text(
                  'Data:',
                  style: CustomTextStyles.texto16Normal,
                ),
                const Spacer(),
                Text(
                  tournament != null
                      ? dateFormat.format(tournament.startDate)
                      : '',
                  style: CustomTextStyles.texto16Normal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.emoji_events, color: CoresPersonalizada.white),
                const SizedBox(width: 8),
                const Text(
                  'Modalidade:',
                  style: CustomTextStyles.texto16Normal,
                ),
                const Spacer(),
                Text(
                  tournament?.modality ?? '',
                  style: CustomTextStyles.texto16Normal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.attach_money, color:CoresPersonalizada.white),
                const SizedBox(width: 8),
                const Text(
                  'Taxa de Inscrição:',
                  style: CustomTextStyles.texto16Normal,
                ),
                const Spacer(),
                Text(
                  tournament != null
                      ? currencyFormat.format(tournament.entryFee)
                      : '',
                  style: CustomTextStyles.texto16Normal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.group, color: CoresPersonalizada.white),
                const SizedBox(width: 8),
                const Text(
                  'Participação:',
                  style: CustomTextStyles.texto16Normal,
                ),
                const Spacer(),
                Text(
                  tournament?.type ?? '',
                  style: CustomTextStyles.texto16Normal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
