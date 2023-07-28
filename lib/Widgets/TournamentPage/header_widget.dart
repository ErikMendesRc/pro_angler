import 'package:flutter/material.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);
    final imageUrl = tournamentProvider.currentTournament?.imageUrl;

    return Container(
      height: 200,
      color: Colors.grey,
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/trophy.png',
              fit: BoxFit.cover,
            ),
    );
  }
}
