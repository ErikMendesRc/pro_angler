import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/nav_bar_icon.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = CoresPersonalizada.white;
    const secondaryColor = Color.fromARGB(255, 107, 196, 255);
    const backgroundColor = CoresPersonalizada.corPrimaria;

    return BottomAppBar(
      color: backgroundColor,
      elevation: 0,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              text: 'Explorar',
              icon: Icons.explore,
              selected: currentIndex == 0,
              onPressed: () {
                if (currentIndex != 0) {
                  Navigator.pushNamed(context, '/homepage');
                }
              },
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: 'Meus Torneios',
              icon: Icons.emoji_events,
              selected: currentIndex == 1,
              onPressed: () {
                if (currentIndex != 1) {
                  Navigator.pushNamed(context, '/mytournaments');
                }
              },
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: 'Criar Torneio',
              icon: Icons.create,
              selected: currentIndex == 2,
              onPressed: () {
                if (currentIndex != 2) {
                  Navigator.pushNamed(context, '/newtournament');
                }
              },
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: 'Perfil',
              icon: Icons.person,
              selected: currentIndex == 3,
              onPressed: () {
                if (currentIndex != 3) {
                  Navigator.pushNamed(context, '/profile');
                }
              },
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
