import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:provider/provider.dart';

import '../../Providers/tournament_provider.dart';
import '../../Util/cores.dart';
import '../../Util/custom_styles.dart';
import '../status_flag.dart';
import '../verified_badge.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key? key, required this.tournament}) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedStartDate = dateFormat.format(tournament.startDate);

    return InkWell(
      onTap: () {
        final tournamentProvider =
            Provider.of<TournamentProvider>(context, listen: false);
        tournamentProvider
            .setCurrentTournament(tournament); // Define o torneio atual
        Navigator.pushNamed(context, '/tournamentpage');
      },
      child: SizedBox(
        width: 200,
        child: Card(
          color: CoresPersonalizada.corCards,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  'https://atrativefish.com.br/wp-content/uploads/2021/04/ocellaris-comum-peixe-palhaco-comum-300x300.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            tournament.name,
                            style: CustomTextStyles.cardsTitles,
                          ),
                          if (tournament.isUserVerified &&
                              tournament.isTournamentVerified)
                            const SizedBox(width: 4.0),
                          VerifiedBadge(
                            isOrganizerVerified: tournament.isUserVerified,
                            isTournamentVerified: tournament.isTournamentVerified,
                          ),
                        ],
                      ),
                      Text(
                        tournament.location,
                        style: CustomTextStyles.cardsSubTitles,
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: CoresPersonalizada.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              formattedStartDate,
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: CoresPersonalizada.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tournament.type,
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.group,
                              color: CoresPersonalizada.corPrimariaIcones,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tournament.modality,
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: StatusFlag(
                          startDate: tournament.startDate,
                          endDate: tournament.endDate,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
