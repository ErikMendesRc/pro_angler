import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import '../../Util/cores.dart';

class TrophyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const TrophyCard({super.key, 
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
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: CustomTextStyles.destaque14Bold,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: CustomTextStyles.texto12Branco,
            ),
          ],
        ),
      ),
    );
  }
}