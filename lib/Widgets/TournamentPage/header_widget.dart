import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Image.asset(
        'assets/images/trophy.png',
        fit: BoxFit.cover,
      ),
    );
  }
}