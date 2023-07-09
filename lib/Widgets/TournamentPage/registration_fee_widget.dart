import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:provider/provider.dart';

import '../../Providers/tournament_provider.dart';
import 'info_item_widget.dart';
import 'section_title_widget.dart';

class RegistrationFeeCard extends StatelessWidget {
  const RegistrationFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);

    final entryFee = tournamentProvider.currentTournament?.entryFee ?? 0;
    final formattedEntryFee =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(entryFee);

    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget('Taxa de Inscrição'),
            const SizedBox(height: 8),
            InfoItemWidget(
                FontAwesomeIcons.moneyCheckDollar, formattedEntryFee),
          ],
        ),
      ),
    );
  }
}
