import 'package:flutter/material.dart';
import 'package:pro_angler/Views/home_page.dart';
import 'package:pro_angler/Views/login_page.dart';
import 'package:pro_angler/Views/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro Anglers',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/homepage': (context) => const HomePage()
      },
    );
  }
}
