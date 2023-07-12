import 'package:flutter/material.dart';

import '../Util/cores.dart';
import '../Util/custom_styles.dart';
import '../Widgets/ProfilePage/achiviement_list.dart';
import '../Widgets/ProfilePage/profile_header.dart';
import '../Widgets/ProfilePage/score_card.dart';
import '../Widgets/ProfilePage/trophy_list.dart';
import '../Widgets/bottom_navigation_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: CoresPersonalizada.corPrimaria,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                children: const [
                  ProfileHeader(),
                  SizedBox(height: 8.0),
                  ScoreCard(),
                  SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Conquistas',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  AchievementList(),
                  SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Troféus',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TrophyList(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: CoresPersonalizada.corPrimaria,
        ),
        child: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}