import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: const Text(
        'Já tem uma conta? Entre',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}