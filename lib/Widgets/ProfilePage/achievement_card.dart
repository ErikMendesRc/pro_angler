import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class AchievementCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const AchievementCard({super.key, 
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: CustomTextStyles.cardTournamentTitle
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: CustomTextStyles.cardTournamentSubTitle
            ),
          ],
        ),
      ),
    );
  }
}