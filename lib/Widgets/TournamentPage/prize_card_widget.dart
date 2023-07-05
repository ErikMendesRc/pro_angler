import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'section_title_widget.dart';

class PrizesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitleWidget('Prêmios e Reconhecimento'),
            SizedBox(height: 8),
            Text(
              'Categoria 1: Maior peixe capturado',
              style: CustomTextStyles.cardsTexts,
            ),
            Text(
              'Categoria 2: Maior quantidade de peixes',
              style: CustomTextStyles.cardsTexts,
            ),
          ],
        ),
      ),
    );
  }
}