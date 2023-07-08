import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import '../../Mock/tournament_mock.dart';
import '../../Models/tournament.dart';
import 'section_title_widget.dart';

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({Key? key}) : super(key: key);

  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  Tournament? tournament;

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
  }

  Future<void> fetchDataFromBackend() async {
    // Simulação de uma solicitação assíncrona ao backend
    await Future.delayed(const Duration(seconds: 0));

    // Obter os torneios em andamento do mock
    final tournaments = MockData.getTorneiosEmAndamento();

    if (tournaments.isNotEmpty) {
      setState(() {
        tournament = tournaments[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corCards,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget('Descrição'),
            const SizedBox(height: 8),
            Text(
              tournament?.description ?? 'Carregando...',  // Verifica se o tournament é nulo
              style: CustomTextStyles.cardsTexts,
            ),
          ],
        ),
      ),
    );
  }
}