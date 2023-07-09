import 'package:flutter/material.dart';

class VerifiedBadge extends StatelessWidget {
  final bool isOrganizerVerified;
  final bool isTournamentVerified;

  const VerifiedBadge({
    Key? key,
    required this.isOrganizerVerified,
    required this.isTournamentVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final bool showBadge = isOrganizerVerified && isTournamentVerified;

    return showBadge
        ? const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: IconTheme(
              data: IconThemeData(size: 8), // Ajuste o valor conforme necessário para diminuir o tamanho do ícone
              child: Icon(
                Icons.verified,
                size: 16.0,
                color: Colors.blue, // Altere a cor do ícone conforme necessário
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
