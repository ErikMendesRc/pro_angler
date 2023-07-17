import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.house),
            title: const Text('Início'),
            onTap: () {
              // Implementar a navegação para a tela Início
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.trophy),
            title: const Text('Torneios'),
            onTap: () {
              // Implementar a navegação para a tela Meu Perfil
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.listCheck),
            title: const Text('Gerenciar Torneios'),
            onTap: () {
              // Implementar a navegação para a tela Meus Torneios
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.userPlus),
            title: const Text('Criar Equipe'),
            onTap: () {
              Navigator.pushNamed(context, '/createteam');
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.fish),
            title: const Text('Enviar Capturas'),
            onTap: () {
              Navigator.pushNamed(context, '/sendCatches');
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear),
            title: const Text('Configurações'),
            onTap: () {
              // Implementar a navegação para a tela Configurações
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.circleInfo),
            title: const Text('Ajuda e Suporte'),
            onTap: () {
              // Implementar a navegação para a tela Ajuda e Suporte
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // Implementar a ação de sair/log out do aplicativo
            },
          ),
        ],
      ),
    );
  }
}
