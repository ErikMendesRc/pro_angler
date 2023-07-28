import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import '../../enum/tournament_team_based.dart';

class TeamTypeRadioButtons extends StatelessWidget {
  final ValueNotifier<TournamentTeamBased> _selectedValueNotifier;

  TeamTypeRadioButtons({
    required TournamentTeamBased value,
    required ValueChanged<TournamentTeamBased> onChanged,
  }) : _selectedValueNotifier = ValueNotifier<TournamentTeamBased>(value) {
    _selectedValueNotifier.addListener(() {
      onChanged(_selectedValueNotifier.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Torneio para Equipe ou Individual ?',
          style: CustomTextStyles.texto14Normal,
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder<TournamentTeamBased>(
          valueListenable: _selectedValueNotifier,
          builder: (context, value, child) {
            return Row(
              children: [
                const Text(
                  'Equipe',
                  style: CustomTextStyles.texto14Normal,
                ),
                Radio<TournamentTeamBased>(
                  value: TournamentTeamBased.equipe,
                  groupValue: value,
                  onChanged: (newValue) {
                    _selectedValueNotifier.value = newValue!;
                  },
                ),
                const SizedBox(width: 20),
                const Text(
                  'Individual',
                  style: CustomTextStyles.texto14Normal,
                ),
                Radio<TournamentTeamBased>(
                  value: TournamentTeamBased.individual,
                  groupValue: value,
                  onChanged: (newValue) {
                    _selectedValueNotifier.value = newValue!;
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
