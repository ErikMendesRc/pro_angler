import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

import '../Widgets/TournamentPage/capture_list_card_widget.dart';
import '../Widgets/TournamentPage/description_card_widget.dart';
import '../Widgets/TournamentPage/general_infocard_widget.dart';
import '../Widgets/TournamentPage/header_widget.dart';
import '../Widgets/TournamentPage/prize_card_widget.dart';
import '../Widgets/TournamentPage/registration_fee_widget.dart';
import '../Widgets/TournamentPage/rules_card_widget.dart';
import '../Widgets/TournamentPage/tournament_ranking_widget.dart';
import '../Widgets/bottom_navigation_bar_widget.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome do Torneio'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const HeaderWidget(),
            const GeneralInfoCard(),
            const DescriptionCard(),
            const RegistrationFeeCard(),
            const RulesCard(),
            PrizesCard(),
            const CaptureListCard(),
            const TournamentRankingCard(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: CoresPersonalizada.corSecundaria, // Defina a cor de fundo do BottomNavigationBar
        ),
        child: BottomNavigationBarWidget(
          currentIndex: _currentIndex, // Defina o índice atual aqui
          onTabTapped: _onTabTapped,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para os botões de ação
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}