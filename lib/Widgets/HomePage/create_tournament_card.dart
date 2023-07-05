import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class CreateTournamentCard extends StatelessWidget {
  const CreateTournamentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // Lógica para o clique no card
        },
        child: SizedBox(
          height: 140,
          child: Card(
            color: CoresPersonalizada.corCards,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/trophy.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Crie seu torneio com a gente.',
                        style: CustomTextStyles.cardTournamentTitle,
                      ),
                      Text('É rápido, fácil e seguro',
                      style: CustomTextStyles.cardTournamentSubTitle,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
