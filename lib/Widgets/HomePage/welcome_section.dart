import 'package:flutter/material.dart';

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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF268CB7),
                    ),
                  ),
                  TextSpan(
                    text: ' Pescador',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF268CB7),
                    ),
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


