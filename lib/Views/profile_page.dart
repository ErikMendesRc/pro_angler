import 'package:flutter/material.dart';

import '../Util/cores.dart';
import '../Util/custom_styles.dart';
import '../Widgets/ProfilePage/achievement_card.dart';
import '../Widgets/ProfilePage/trophy_card.dart';
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
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('path_to_avatar_image'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nome da Pessoa',
                    style: CustomTextStyles.titleText,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Localização da Pessoa',
                    style: CustomTextStyles.profileLocal,
                  ),
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Conquistas',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 150,
                          child: AchievementCard(
                            imagePath: 'path_to_achievement_image',
                            title: 'Conquista $index',
                            subtitle: 'Descrição curta',
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Troféus',
                      style: CustomTextStyles.text20Bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 150,
                          child: TrophyCard(
                            imagePath: 'assets/images/trofeu.png',
                            title: 'CAMPEÃO',
                            subtitle: 'Campeão CIP 2022',
                          ),
                        );
                      },
                    ),
                  ),
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
