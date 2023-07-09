import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class TournamentRulesFormField extends StatelessWidget {
  final TextEditingController rulesController;

  const TournamentRulesFormField({
    Key? key,
    required this.rulesController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: rulesController,
      maxLines: 4,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Regras do Torneio',
        labelStyle: CustomTextStyles.cardsTexts,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), 
        ),
      ),
    );
  }
}
