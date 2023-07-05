import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8), // Espaçamento vertical desejado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Bem Vindo, ',
                    style: CustomTextStyles.titleText,
                  ),
                  TextSpan(
                    text: ' Pescador',
                    style: CustomTextStyles.subtitleText,
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}


