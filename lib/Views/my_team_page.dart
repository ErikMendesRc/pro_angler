import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

import '../Widgets/MyTeamPage/member_widget.dart';
import '../Widgets/MyTeamPage/team_header_widget.dart.dart';
import '../Widgets/MyTeamPage/trophies_widget.dart';

class MyTeamPage extends StatelessWidget {
  const MyTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: CoresPersonalizada.corPrimaria,
        centerTitle: true,
        title: const Text('Minha Equipe'),
      ),
      body: Container(
        height: mq.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
            radius: 1.5,
            center: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TeamHeaderWidget(),
                TrophiesWidget(),
                MembersWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
