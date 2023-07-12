import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import '../../enum/tournament_team_based.dart';

class TeamTypeRadioButtons extends StatefulWidget {
  final ValueChanged<TournamentTeamBased> onChanged;
  final TournamentTeamBased value;

  const TeamTypeRadioButtons({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  _TeamTypeRadioButtonsState createState() => _TeamTypeRadioButtonsState();
}

class _TeamTypeRadioButtonsState extends State<TeamTypeRadioButtons> {
  TournamentTeamBased _selectedValue = TournamentTeamBased.Equipe;

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Torneio para Equipe ou Individual ?',
          style: CustomTextStyles.texto14Normal
        ),
        Row(
          children: [
            const Text(
              'Equipe',
              style: CustomTextStyles.texto14Normal,
            ),
            Radio<TournamentTeamBased>(
              value: TournamentTeamBased.Equipe,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                  widget.onChanged(_selectedValue);
                });
              },
            ),
            const Text(
              'Individual',
              style: CustomTextStyles.texto14Normal,
            ),
            Radio<TournamentTeamBased>(
              value: TournamentTeamBased.Individual,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                  widget.onChanged(_selectedValue);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
