import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Mock/mock_teams.dart';
import '../../Models/team.dart';
import '../../Models/user.dart';
import '../../Providers/tournament_provider.dart';
import '../../Providers/user_provider.dart';
import '../../enum/tournament_team_based.dart';

class RegistrationSection extends StatefulWidget {
  const RegistrationSection({Key? key}) : super(key: key);

  @override
  _RegistrationSectionState createState() => _RegistrationSectionState();
}

class _RegistrationSectionState extends State<RegistrationSection> {
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final TournamentProvider tournamentProvider = Provider.of<TournamentProvider>(context);
     final screenHeight = MediaQuery.of(context).size;

    final TournamentTeamBased teamBased = tournamentProvider.currentTournament?.teamBased ?? TournamentTeamBased.individual;

    if (teamBased == TournamentTeamBased.individual) {
      final UserData? currentUser = userProvider.currentUser;
      return Container(
        height: screenHeight.height, // Definindo a altura para ocupar toda a tela
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dados da Inscrição',
                style: CustomTextStyles.texto16Bold,
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Nome/Apelido',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  prefixIcon: Icon(Icons.person, color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                initialValue: currentUser?.name,
              ),
              TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Número do WhatsApp',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  prefixIcon: Icon(Icons.phone, color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
              ),
              TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  prefixIcon: Icon(Icons.email, color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                initialValue: currentUser?.email,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: isCheckboxChecked,
                    onChanged: (value) {
                      setState(() {
                        isCheckboxChecked = value ?? false;
                      });
                    },
                    fillColor: MaterialStateProperty.all(CoresPersonalizada.white),
                  ),
                  const Text(
                    'Eu li e aceito as Regras do Torneio',
                    style: CustomTextStyles.texto14Normal,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: isCheckboxChecked
                      ? () {
                          // Lógica para realizar a inscrição
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCheckboxChecked ? CoresPersonalizada.white : Colors.grey,
                  ),
                  child: Text(
                    'Inscrever-se',
                    style: TextStyle(
                      color: isCheckboxChecked ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      final UserData? currentUser = userProvider.currentUser;
      final List<Team> userTeams = currentUser != null ? MockTeams.getTeamsByParticipantId(currentUser.id) : [];
      final bool hasTeam = userTeams.isNotEmpty;

      final Team? team = hasTeam ? userTeams.first : null;

      return Container(
        height: screenHeight.height, // Definindo a altura para ocupar toda a tela
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dados da Inscrição',
                style: CustomTextStyles.texto16Bold,
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Nome da Equipe',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  prefixIcon: Icon(Icons.people, color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                initialValue: team?.name ?? '',
                readOnly: true,
              ),
              const SizedBox(height: 8),
              if (!hasTeam) ...[
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para criar uma equipe
                    },
                    child: Text('Criar Equipe'),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: isCheckboxChecked,
                    onChanged: (value) {
                      setState(() {
                        isCheckboxChecked = value ?? false;
                      });
                    },
                    fillColor: MaterialStateProperty.all(CoresPersonalizada.white),
                  ),
                  const Text(
                    'Eu li e aceito as Regras do Torneio',
                    style: CustomTextStyles.texto14Normal,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: isCheckboxChecked
                      ? () {
                         Navigator.pushNamed(context, '/payment');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCheckboxChecked ? CoresPersonalizada.white : Colors.grey,
                  ),
                  child: Text(
                    'Inscrever-se',
                    style: TextStyle(
                      color: isCheckboxChecked ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}