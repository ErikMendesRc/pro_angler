import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/team_provider.dart';
import '../../Providers/user_provider.dart';
import '../../Util/custom_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final teamProvider = Provider.of<TeamProvider>(context, listen: false);

    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final user = userProvider.user;
        final team = teamProvider.team;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60, // Reduzindo o tamanho do avatar
              backgroundImage: NetworkImage("${user?.photo}"),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? 'Carregando...',
                  style: CustomTextStyles.titleText,
                ),
                const SizedBox(height: 6),
                Text(
                  user?.city ?? 'Carregando...',
                  style: CustomTextStyles.profileLocal,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/myteam');
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.group,
                        size: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        team != null ? team.name : 'Sem equipe',
                        style:CustomTextStyles.texto16Bold
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // Aumentando o espaçamento vertical
              ],
            ),
          ],
        );
      },
    );
  }
}
