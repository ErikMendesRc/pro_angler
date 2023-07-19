import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class TournamentHeaderWidget extends StatelessWidget {
  const TournamentHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://yt3.googleusercontent.com/ytc/AOPolaRJZhlxDN1Q8DrlsaLz48khjq567C05LBFknhsM=s900-c-k-c0x00ffffff-no-rj'),
          maxRadius: 50,
          minRadius: 50,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'CIP 2023',
              style: CustomTextStyles.texto16Bold,
            ),
            SizedBox(height: 8.0),
            Text(
              'Total de Participantes: 10',
              style: CustomTextStyles.destaque14Bold,
            ),
            SizedBox(height: 8.0),
            Text(
              'Organizador: Moreno',
              style: CustomTextStyles.destaque14Bold,
            ),
          ],
        ),
      ],
    );
  }
}