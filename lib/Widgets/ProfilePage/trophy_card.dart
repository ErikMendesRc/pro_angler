import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

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
      color: CoresPersonalizada.corPrimaria,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: CustomTextStyles.texto16Bold
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: CustomTextStyles.texto12Branco,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}