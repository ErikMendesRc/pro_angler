import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import '../../Models/tournament.dart';
import '../status_flag.dart';

class MyTournamentCard extends StatelessWidget {
  final Tournament tournament;

  const MyTournamentCard(this.tournament, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd/MM/yyyy');

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tournament.name,
                        style: CustomTextStyles.texto16Normal,
                      ),
                      const SizedBox(width: 4.0),
                      if (tournament.isTournamentVerified)
                        const Icon(
                          Icons.verified,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Status:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      const Spacer(),
                      StatusFlag(
                        startDate: tournament.startDate,
                        endDate: tournament.endDate,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Seu Ranking:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      Spacer(),
                      Text(
                        '6º Lugar',
                        style: CustomTextStyles.cardsTexts,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Local:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      const Spacer(),
                      Text(
                        tournament.location,
                        style: CustomTextStyles.cardsTexts,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        FontAwesomeIcons.fish,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Modalidade:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      const Spacer(),
                      Text(
                        tournament.modality,
                        style: CustomTextStyles.cardsTexts,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Início:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      const Spacer(),
                      Text(
                        dateFormatter.format(tournament.startDate),
                        style: CustomTextStyles.cardsTexts,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Término:',
                        style: CustomTextStyles.cardsTexts,
                      ),
                      const Spacer(),
                      Text(
                        dateFormatter.format(tournament.endDate),
                        style: CustomTextStyles.cardsTexts,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
