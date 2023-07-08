import 'package:flutter/material.dart';

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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
            Navigator.pushNamed(context, '/homepage');
              break;
            case 2:
              Navigator.pushNamed(context, '/newtournament');
              break;
            case 3:
              if (currentIndex != 3) {
                Navigator.pushNamed(context, '/profile');
              }
              break;
            default:
              onTabTapped(index);
              break;
          }
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: 'Meus Torneios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          label: 'Criar Torneio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
