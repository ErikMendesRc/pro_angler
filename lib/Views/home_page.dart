import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:pro_angler/Widgets/bottom_navigation_bar_widget.dart';

import '../Widgets/HomePage/create_tournament_card.dart';
import '../Widgets/HomePage/tournament_section.dart';
import '../Widgets/HomePage/welcome_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        shadowColor: const Color.fromARGB(255, 190, 190, 190),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Pro Angler's",
          style: TextStyle(
            color: CoresPersonalizada.corTextoDestaque,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            WelcomeSection(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TournamentSection(
                title: 'Torneios em andamento',
                itemCount: 3,
                textStyle: CustomTextStyles.sessionTitles,
              ),
            ),
            CreateTournamentCard(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TournamentSection(
                title: 'Ver todos os Torneios',
                itemCount: 3,
                textStyle: CustomTextStyles.sessionTitles,
              ),
            ),
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
    );
  }
}