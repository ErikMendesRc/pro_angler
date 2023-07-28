import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../status_flag.dart';
import 'info_item_widget.dart';
import 'section_title_widget.dart';

class GeneralInfoCard extends StatelessWidget {
  const GeneralInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd/MM/yyyy');

    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget('Informações Gerais'),
            const SizedBox(height: 8),
            Consumer<TournamentProvider>(
              builder: (context, tournamentProvider, _) {
                final currentTournament = tournamentProvider.currentTournament;

                if (currentTournament != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Início do torneio',
                          style: CustomTextStyles.cardsTexts
                        ),
                      ),
                      InfoItemWidget(FontAwesomeIcons.calendar, dateFormatter.format(currentTournament.startDate.toDate())),
                      const SizedBox(height: 8),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Fim do torneio',
                          style: CustomTextStyles.cardsTexts
                        ),
                      ),
                      InfoItemWidget(FontAwesomeIcons.calendarCheck, dateFormatter.format(currentTournament.endDate.toDate())),
                      InfoItemWidget(FontAwesomeIcons.mapLocation, currentTournament.location),
                      const SizedBox(height: 8),
                      StatusFlag(
                        startDate: currentTournament.startDate.toDate(),
                        endDate: currentTournament.endDate.toDate(),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
