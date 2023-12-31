import 'package:flutter/material.dart';
import 'package:pro_angler/Widgets/HomePage/tournament_card.dart';
import 'package:provider/provider.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';

import '../../Util/cores.dart';
import '../../enum/tournament_status.dart';

class TournamentSection extends StatelessWidget {
  final String title;
  final TournamentStatus status;
  final TextStyle textStyle;

  const TournamentSection({
    Key? key,
    required this.title,
    required this.status,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TournamentProvider>(
      builder: (context, tournamentProvider, _) {
        List<Tournament> tournaments = tournamentProvider.tournaments;
        List<Tournament> filteredTournaments;

        if (status == TournamentStatus.emAndamento) {
          filteredTournaments = tournaments
              .where((tournament) => tournament.status == 'Em Andamento')
              .toList();
        } else if (status == TournamentStatus.todos) {
          filteredTournaments = tournaments;
        } else {
          filteredTournaments = [];
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      title,
                      style: textStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Implemente a ação para visualizar todos os torneios
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Ver todos',
                          style: TextStyle(
                            color: CoresPersonalizada.corTextoDestaque,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filteredTournaments.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return TournamentCard(tournament: filteredTournaments[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}