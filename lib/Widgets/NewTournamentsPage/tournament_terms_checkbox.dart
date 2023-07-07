import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentTermsCheckbox extends StatelessWidget {
  final bool acceptTerms;
  final ValueChanged<bool?> onTermsChanged;

  const TournamentTermsCheckbox({
    Key? key,
    required this.acceptTerms,
    required this.onTermsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: acceptTerms,
          onChanged: onTermsChanged,
          checkColor: CoresPersonalizada.white,
          activeColor: CoresPersonalizada.white,
        ),
        GestureDetector(
          onTap: () {
            // Adicione a lógica aqui para lidar com o evento onTap
          },
          child: RichText(
            text: const TextSpan(
              text: 'Aceito os ',
              style: TextStyle(color: CoresPersonalizada.white),
              children: [
                TextSpan(
                  text: 'Termos e Condições',
                  style: TextStyle(
                    color: CoresPersonalizada.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}