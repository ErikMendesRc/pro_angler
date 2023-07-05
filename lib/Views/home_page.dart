import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

import '../Widgets/HomePage/create_tournament_card.dart';
import '../Widgets/HomePage/tournament_section.dart';
import '../Widgets/HomePage/welcome_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Pro Angler's",
        style: TextStyle(
          color: CoresPersonalizada.corTextoDestaque
        ),),
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
                textStyle: TextStyle(
                  color: CoresPersonalizada.corTextoDestaque,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CreateTournamentCard(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: TournamentSection(
                title: 'Ver todos os Torneios',
                itemCount: 3,
                textStyle: TextStyle(
                  color: CoresPersonalizada.corTextoDestaque,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}