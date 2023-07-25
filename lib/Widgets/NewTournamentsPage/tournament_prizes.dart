import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentPrizesFormField extends StatelessWidget {
  final TextEditingController prizesController;

  const TournamentPrizesFormField({
    Key? key,
    required this.prizesController,
  }) : super(key: key);

  String? _validatePrizes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe as premiações do torneio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: prizesController,
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Premiações',
        prefixIcon: Icon(Icons.monetization_on, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
      validator: _validatePrizes,
    );
  }
}

