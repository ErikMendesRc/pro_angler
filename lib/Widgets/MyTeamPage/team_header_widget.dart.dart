import 'package:flutter/material.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Providers/team_provider.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

class TeamHeaderWidget extends StatelessWidget {
  const TeamHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context, listen: true);
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.getCurrentUser();
    final team = teamProvider.team;

    if (team == null) {
      return const CircularProgressIndicator();
    }

    return FutureBuilder<UserData?>(
      future: currentUser!.id == team.creatorId
          ? Future.value(currentUser)
          : userProvider.getUserById(team.creatorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return const Text('Ocorreu um erro ao carregar o capitão');
        }

        final captain = snapshot.data;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(team.photo ?? ''),
                    radius: 40,
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(team.name, style: CustomTextStyles.text20Bold),
                      const SizedBox(height: 8.0),
                      Text(
                        team.city,
                        style: CustomTextStyles.texto16Normal,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('Capitão: ', style: CustomTextStyles.texto16Bold),
                  GestureDetector(
                    onTap: () {},
                    child: Text(captain?.name ?? '',
                        style: CustomTextStyles.texto16BoldUnderline),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
