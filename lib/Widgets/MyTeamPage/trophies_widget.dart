import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Models/achiviement.dart';
import '../../Models/tournament.dart';
import '../../Providers/team_provider.dart';

class TrophiesWidget extends StatelessWidget {
  const TrophiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChampionTrophys> trophies =
        Provider.of<TeamProvider>(context).team?.achievements ?? [];
    final TeamProvider teamProvider = Provider.of<TeamProvider>(context);
    final DateFormat dateFormat = DateFormat('yyyy');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Troféus da Equipe',
            style: CustomTextStyles.text20Bold,
          ),
          SizedBox(
            height: 200,
            child: trophies.isEmpty
                ? const Center(
                    child: Text(
                      'Ainda não possui troféus :(',
                      style: CustomTextStyles.texto16Bold,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trophies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ChampionTrophys trophy = trophies[index];
                      final Tournament tournament =
                          teamProvider.getTournamentById(trophy.tournamentId);
                      return Card(
                        color: CoresPersonalizada.corPrimaria,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'caminho/para/imagem_trofeu.jpg'),
                                radius: 30,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                trophy.name,
                                style: CustomTextStyles.texto16Bold,
                              ),
                              Text(
                                '${trophy.description} do torneio \n${tournament.name}\n em ${dateFormat.format(tournament.startDate.toDate())}',
                                style: CustomTextStyles.texto12Branco,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
