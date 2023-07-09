import 'package:flutter/material.dart';
import 'package:pro_angler/Views/home_page.dart';
import 'package:pro_angler/Views/login_page.dart';
import 'package:pro_angler/Views/my_tournaments_page.dart';
import 'package:pro_angler/Views/profile_page.dart';
import 'package:pro_angler/Views/signup_page.dart';
import 'package:pro_angler/Views/tournaments_page.dart';
import 'package:provider/provider.dart';

import 'Providers/tournament_provider.dart';
import 'Views/new_tournament_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TournamentProvider>(
          create: (_) => TournamentProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
        '/homepage': (context) => const HomePage(),
        '/tournamentpage': (context) => const TournamentPage(),
        '/newtournament': (context) => const NewTournamentPage(),
        '/profile': (context) => const ProfilePage(),
        '/mytournaments': (context) => const MyTournamentsPage()
      },
    );
  }
}