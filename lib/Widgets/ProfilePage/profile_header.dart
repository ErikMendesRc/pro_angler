import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/team_provider.dart';
import '../../Providers/user_provider.dart';
import '../../Util/custom_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context);
    
    final user = userProvider.getCurrentUser();
    if (user == null) {
      return const CircularProgressIndicator();
    }

    return FutureBuilder(
      future: teamProvider.fetchUserTeam(user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        
        if (snapshot.hasError) {
          // Opcional: você pode retornar algum widget para exibir um erro aqui
          return Text('Ocorreu um erro ao carregar a equipe');
        }

        final teamName = teamProvider.team?.name;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.photoURL ?? ''),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: CustomTextStyles.titleText,
                ),
                const SizedBox(height: 6),
                Text(
                  user.city,
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
                       teamName ?? 'Sem equipe',
                        style: CustomTextStyles.texto16Bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        );
      },
    );
  }
}
