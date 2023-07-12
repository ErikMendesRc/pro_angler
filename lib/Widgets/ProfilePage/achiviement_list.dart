import 'package:flutter/cupertino.dart';

import 'achievement_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/user_provider.dart';

class AchievementList extends StatelessWidget {
  const AchievementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: user?.personalAchiviements?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final achievement = user?.personalAchiviements?[index];
          return SizedBox(
            width: 150,
            child: AchievementCard(
              imagePath: achievement?.photo ?? '',
              title: achievement?.name ?? '',
              subtitle: achievement?.description ?? '',
            ),
          );
        },
      ),
    );
  }
}
