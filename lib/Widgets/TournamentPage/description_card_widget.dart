import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'section_title_widget.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitleWidget('Descrição'),
            SizedBox(height: 8),
            Text(
              'Breve descrição sobre o torneio.',
              style: CustomTextStyles.cardsTexts,
            ),
          ],
        ),
      ),
    );
  }
}