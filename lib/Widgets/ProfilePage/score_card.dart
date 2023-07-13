import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Providers/user_provider.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    final participatingTournaments = userProvider.getParticipatingTournaments();

    final totalConquistas = user?.personalAchiviements?.length ?? 0;
    final totalTrofeus = user?.championTrophys?.length ?? 0;
    final totalTorneios = participatingTournaments.length;

    return Card(
      color: CoresPersonalizada.corPrimaria,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.emoji_events,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Conquistas',
                  style: CustomTextStyles.texto14Normal,
                ),
                const SizedBox(height: 4),
                Text(
                  totalConquistas.toString(),
                  style: CustomTextStyles.texto14Normal,
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 1,
            ),
            Column(
              children: [
                const Icon(
                  Icons.sports_esports,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Torneios',
                  style: CustomTextStyles.texto14Normal,
                ),
                const SizedBox(height: 4),
                Text(
                  totalTorneios.toString(),
                  style: CustomTextStyles.texto14Normal,
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.white,
              thickness: 1,
            ),
            Column(
              children: [
                const Icon(
                  Icons.stars,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Troféus',
                  style: CustomTextStyles.texto14Normal,
                ),
                const SizedBox(height: 4),
                Text(
                  totalTrofeus.toString(),
                  style: CustomTextStyles.texto14Normal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
