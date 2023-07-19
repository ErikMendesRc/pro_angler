import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/info_tournament_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/list_section_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/participant_card_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/ranking_card_widget.dart';
import 'package:pro_angler/Widgets/AdminTournamentPage/tournament_header_widget.dart';
import 'package:pro_angler/Widgets/top_navigation.dart';

class TournamentAdminPage extends StatefulWidget {
  const TournamentAdminPage({super.key});

  @override
  _TournamentAdminPageState createState() => _TournamentAdminPageState();
}

class _TournamentAdminPageState extends State<TournamentAdminPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administração'),
        centerTitle: true,
        backgroundColor: CoresPersonalizada.corPrimaria,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TopNavigationWidget(tabController: _tabController),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TournamentHeaderWidget(),
                  const SizedBox(height: 20),
                  InfoTournamentWidget(),
                  const SizedBox(height: 20),
                  ListSectionWidget(
                    title: 'Moderadores',
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ParticipantCardWidget(
                        participantName: 'Teste',
                        participantCity: 'Teste ${index + 1}',
                        participantPhoto:
                            'caminho/para/a/foto_do_participante.jpg',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TournamentHeaderWidget(),
                  const SizedBox(height: 20),
                  ListSectionWidget(
                    title: 'Ranking',
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      return RankingCardWidget(rank: index + 1, index: index);
                    },
                  ),
                ],
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    );
  }
}
