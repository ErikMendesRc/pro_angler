import 'package:flutter/material.dart';

class TopNavigationWidget extends StatelessWidget {
  const TopNavigationWidget({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const[
        Tab(text: 'Geral'),
        Tab(text: 'Capturas'),
        Tab(text: 'Ranking'),
        Tab(text: 'Sorteios'),
      ],
    );
  }
}