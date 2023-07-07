import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentNameFormField extends StatelessWidget {
  const TournamentNameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Nome do Torneio',
        prefixIcon: Icon(Icons.title, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
    );
  }
}