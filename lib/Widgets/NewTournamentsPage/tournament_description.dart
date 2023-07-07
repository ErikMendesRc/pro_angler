import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentDescriptionFormField extends StatelessWidget {
  const TournamentDescriptionFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Descrição',
        prefixIcon: Icon(Icons.description, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
      maxLines: 3,
    );
  }
}