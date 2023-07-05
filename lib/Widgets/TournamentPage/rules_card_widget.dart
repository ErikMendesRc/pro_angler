import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'section_title_widget.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitleWidget('Regras e Regulamentos'),
            SizedBox(height: 8),
            Text(
              '1. Tamanho mínimo dos peixes: 30 cm',
              style: CustomTextStyles.cardsTexts,
            ),
            Text(
              '2. Técnicas de pesca permitidas: ...',
              style: CustomTextStyles.cardsTexts,
            ),
            Text(
              '3. Limites de captura: ...',
              style: CustomTextStyles.cardsTexts,
            ),
          ],
        ),
      ),
    );
  }
}