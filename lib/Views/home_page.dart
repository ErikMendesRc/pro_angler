import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:pro_angler/Widgets/bottom_navigation_bar_widget.dart';
import 'package:pro_angler/enum/tournament_status.dart';
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
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: const Text(
          "Pro Angler's",
          style: TextStyle(
            color: CoresPersonalizada.corTextoDestaque,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria
            ],
            center: Alignment.center,
            radius: 1.0,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: const <Widget>[
              WelcomeSection(),
              Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: TournamentSection(
                  title: 'Torneios em andamento',
                  textStyle: CustomTextStyles.text20Bold,
                  status: TournamentStatus.emAndamento,
                ),
              ),
              CreateTournamentCard(),
              Padding(
                padding:EdgeInsets.only(bottom: 2.0),
                child: TournamentSection(
                  title: 'Ver todos os Torneios',
                  textStyle: CustomTextStyles.text20Bold,
                  status: TournamentStatus.todos,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
    );
  }
}