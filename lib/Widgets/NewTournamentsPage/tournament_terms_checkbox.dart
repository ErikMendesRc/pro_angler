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

  String? _validateTerms(bool? value) {
    if (value == null || !value) {
      return 'Por favor, aceite os Termos e Condições de Uso.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                  text: 'Eu aceito os ',
                  style: TextStyle(color: CoresPersonalizada.white),
                  children: [
                    TextSpan(
                      text: 'Termos e Condições de Uso',
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
        ),
        if (_validateTerms(acceptTerms) != null)
          Text(
            _validateTerms(acceptTerms)!,
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}