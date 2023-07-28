import 'package:flutter/material.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final UserData? user = userProvider.getCurrentUser();

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Bem Vindo, ',
                    style: CustomTextStyles.titleText,
                  ),
                  TextSpan(
                    text: user?.name,
                    style: CustomTextStyles.subtitleText,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}


