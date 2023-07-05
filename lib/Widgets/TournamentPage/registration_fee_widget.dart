import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_angler/Util/cores.dart';

import 'info_item_widget.dart';
import 'section_title_widget.dart';

class RegistrationFeeCard extends StatelessWidget {
  const RegistrationFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitleWidget('Taxa de Inscrição'),
            SizedBox(height: 8),
            InfoItemWidget( FontAwesomeIcons.moneyCheckDollar, 'R\$50,00'),
          ],
        ),
      ),
    );
  }
}