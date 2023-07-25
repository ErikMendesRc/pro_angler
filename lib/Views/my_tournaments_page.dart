import 'package:flutter/material.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:provider/provider.dart';

import '../Providers/tournament_provider.dart';
import '../Providers/user_provider.dart';
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
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final tournamentProvider = Provider.of<TournamentProvider>(context, listen: false);
    final String userId = userProvider.currentUser?.id ?? '';
    tournamentProvider.fetchTournamentsByUserId(userId);
  }

  @override
  Widget build(BuildContext context) {
    final tournamentProvider = Provider.of<TournamentProvider>(context);

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
        child: FutureBuilder<List<Tournament>>(
          future: Future.value(tournamentProvider.tournaments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(child: Text('Error loading tournaments'));
            } else {
              List<Tournament> tournaments = snapshot.data!;
              return ListView.builder(
                itemCount: tournaments.length,
                itemBuilder: (context, index) {
                  final tournament = tournaments[index];
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