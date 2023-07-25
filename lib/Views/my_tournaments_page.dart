import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';
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
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final tournamentProvider = Provider.of<TournamentProvider>(context);

    final isUserParticipatingInAnyTournament =
        tournamentProvider.isUserParticipatingInAnyTournament(
            userProvider.currentUser?.id ?? '');

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
        child: isUserParticipatingInAnyTournament
            ? ListView.builder(
                itemCount: tournamentProvider.tournaments.length,
                itemBuilder: (context, index) {
                  final tournament = tournamentProvider.tournaments[index];
                  final isUserParticipating = tournament.competitorsIds
                          ?.contains(userProvider.currentUser?.id) ??
                      false;

                  if (isUserParticipating) {
                    return MyTournamentCard(tournament);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            : const Center(
                child: Text(
                  "Você ainda não participa de torneios :(",
                  style: CustomTextStyles.text20Bold,
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
