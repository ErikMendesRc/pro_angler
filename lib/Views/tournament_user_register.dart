import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

import '../Widgets/TournamentUserRegister/registration_section.dart';
import '../Widgets/TournamentUserRegister/rules.dart';
import '../Widgets/TournamentUserRegister/tournment_info_card.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: const Text('Inscrever-se'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
            center: Alignment.center,
            radius: 0.9,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: screenHeight * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TournamentInfoCard(),
              SizedBox(height: 16),
              RulesSection(),
              SizedBox(height: 16),
              RegistrationSection(),
            ],
          ),
        ),
      ),
    );
  }
}




