import 'package:flutter/material.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:pro_angler/Widgets/ProfilePage/achiviement_list.dart';
import 'package:pro_angler/Widgets/ProfilePage/score_card.dart';
import 'package:pro_angler/Widgets/ProfilePage/trophy_list.dart';

import '../Widgets/ProfilePage/profile_header.dart';

class UsersProfilePage extends StatelessWidget {
  const UsersProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserData? user = ModalRoute.of(context)?.settings.arguments as UserData?;
    final mediaQuery = MediaQuery.of(context).size;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: CoresPersonalizada.corPrimaria,
        ),
        body: const Center(
          child: Text('Nenhum usuário selecionado.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: CoresPersonalizada.corPrimaria,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.height,
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileHeader(user: user),
                  const SizedBox(height: 8.0),
                  ScoreCard(userId: user.id),// Pass the selected user data here
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Conquistas',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  AchievementList(userId: user.id),
                  const SizedBox(height: 50),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Troféus',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  const SizedBox(height: 100.0),
                  TrophyList(userId: user.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}