import 'package:flutter/material.dart';
import 'package:pro_angler/Providers/team_provider.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

class TeamHeaderWidget extends StatelessWidget {
  const TeamHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    final team = teamProvider.team;
    final captain = team?.participants.firstWhere((participant) => participant.id == team.creatorId);


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               CircleAvatar(
                backgroundImage:NetworkImage(team?.photo ?? ''),
                radius: 40,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team?.name ?? 'Carregando nome...',
                    style: CustomTextStyles.text20Bold
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    team?.city ?? 'Carregando cidade...',
                    style: CustomTextStyles.texto16Normal,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text(
                'Capitão: ',
                style: CustomTextStyles.texto16Bold
              ),  
              GestureDetector(
                onTap: () {
                  // Ação ao tocar no líder da equipe (capitão), por exemplo, abrir o perfil do líder
                },
                child: Text(
                  captain?.name ?? 'Carregando nome...',
                  style: CustomTextStyles.texto16BoldUnderline
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
