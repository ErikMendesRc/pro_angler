import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/tournament_provider.dart';
import '../Util/cores.dart';
import '../Widgets/MyTournamentPage/my_tournaments_cards.dart';
import '../Widgets/bottom_navigation_bar_widget.dart';

class MyTournamentsPage extends StatefulWidget {
  const MyTournamentsPage({Key? key}) : super(key: key);

  @override
  _MyTournamentsPageState createState() => _MyTournamentsPageState();
}

class _MyTournamentsPageState extends State<MyTournamentsPage> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresPersonalizada.corPrimaria,
        elevation: 0,
        centerTitle: true,
        title: const Text('Meus Torneios'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1.2,
            center: Alignment.center,
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
          ),
        ),
        child: Consumer<TournamentProvider>(
          builder: (context, tournamentProvider, _) {
            if (tournamentProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (tournamentProvider.error.isNotEmpty) {
              return Center(
                child: Text(tournamentProvider.error),
              );
            } else {
              return ListView.builder(
                itemCount: tournamentProvider.tournaments.length,
                itemBuilder: (context, index) {
                  final tournament = tournamentProvider.tournaments[index];
                  return MyTournamentCard(tournament);
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}

