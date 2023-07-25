import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class TournamentEntryFeeSwitchTile extends StatelessWidget {
  final bool hasEntryFee;
  final ValueChanged<bool> onEntryFeeChanged;

  const TournamentEntryFeeSwitchTile({
    Key? key,
    required this.hasEntryFee,
    required this.onEntryFeeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SwitchListTile(
          title: const Text(
            'O torneio possui uma taxa de inscrição?',
            style: CustomTextStyles.cardsTexts,
          ),
          value: hasEntryFee,
          onChanged: (value) {
            setState(() {
              onEntryFeeChanged(value);
            });
          },
        );
      },
    );
  }
}
