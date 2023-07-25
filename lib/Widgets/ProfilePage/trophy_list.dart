import 'package:intl/intl.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:pro_angler/Widgets/ProfilePage/trophy_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/achiviement.dart';
import '../../Models/tournament.dart';
import '../../Providers/tournament_provider.dart';
import '../../Providers/user_provider.dart';

class TrophyList extends StatelessWidget {
  final String userId;

  const TrophyList({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final tournamentProvider =
        Provider.of<TournamentProvider>(context, listen: false);

    return FutureBuilder<UserData?>(
      future: userProvider.getUserById(userId),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (userSnapshot.hasError) {
          return Text('Erro ao carregar usuário: ${userSnapshot.error}');
        }

        final UserData? user = userSnapshot.data;
        final List<ChampionTrophys>? trophies = user?.championTrophys;
        
        if (trophies == null || trophies.isEmpty) {
          return const Center(
            child: Text(
              'Você não possui troféus ainda :(',
              style: CustomTextStyles.texto16Bold,
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trophies.length,
            itemBuilder: (BuildContext context, int index) {
              final trophy = trophies[index];
              final tournament =
                  _findTournament(tournamentProvider, trophy.tournamentId);

              return SizedBox(
                width: 150,
                child: TrophyCard(
                  imagePath: trophy.photo ?? '',
                  title: trophy.name,
                  subtitle: _buildSubtitle(trophy, tournament),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Tournament? _findTournament(
      TournamentProvider tournamentProvider, String? tournamentId) {
    try {
      return tournamentProvider.tournaments
          .firstWhere((tournament) => tournament.id == tournamentId);
    } catch (e) {
      return null;
    }
  }

  String _buildSubtitle(ChampionTrophys? trophy, Tournament? tournament) {
    if (trophy == null || tournament == null) return '';

    final dateFormat = DateFormat('yyyy');
    return '${trophy.description}torneio \n${tournament.name}\n em ${tournament.startDate != null ? dateFormat.format(tournament.startDate.toDate()) : ''}';
  }
}
