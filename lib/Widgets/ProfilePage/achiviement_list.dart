import 'package:pro_angler/Models/personal_achievement.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'achievement_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/user_provider.dart';

class AchievementList extends StatelessWidget {
  final String userId;

  const AchievementList({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder<UserData?>(
      future: userProvider.getUserById(userId),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (userSnapshot.hasError) {
          return Text('Erro ao carregar usuário: ${userSnapshot.error}');
        }

        final UserData? user = userSnapshot.data;
        final List<PersonalAchieviments>? achievements = user?.personalAchiviements;

        if (achievements == null || achievements.isEmpty) {
          return const Center(
            child: Text(
              'Você não possui conquistas ainda :(',
              style: CustomTextStyles.texto16Bold,
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: achievements.length,
            itemBuilder: (BuildContext context, int index) {
              final achievement = achievements[index];
              return SizedBox(
                width: 150,
                child: AchievementCard(
                  imagePath: achievement.photo ?? '',
                  title: achievement.name,
                  subtitle: achievement.description,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

