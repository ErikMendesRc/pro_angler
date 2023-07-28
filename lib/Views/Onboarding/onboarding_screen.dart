import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:pro_angler/Models/Onboarding%20Pages/onboarding_model.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/Onboarding/onboarding_page_widget.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Crie ou participe de torneios.',
      description: 'Estamos focados em melhorar a competitividade na pesca.',
      imageUrl: 'assets/images/torneio.png',
    ),
    OnboardingPage(
      title: 'Crie sua equipe.',
      description: 'Crie sua equipe e destaque-se nos torneios.',
      imageUrl: 'assets/images/equipe.png',
    ),
    OnboardingPage(
      title: 'Mostre que você é o melhor.',
      description: 'Conquistas e Troféus são atribuídos ao seu perfil, destaque-se.',
      imageUrl: 'assets/images/sucesso.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresPersonalizada.corSecundaria,
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return OnboardingPageWidget(page: pages[index]);
        },
        itemCount: pages.length,
        pagination: const SwiperPagination(),
        loop: false,
      ),
      floatingActionButton: _buildFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    if (pages.isNotEmpty) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        backgroundColor: CoresPersonalizada.corPrimaria,
        child: const Icon(Icons.arrow_forward),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}