import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/tournamentpage');
      },
      child: SizedBox(
        width: 200,
        child: Card(
          color: CoresPersonalizada.corCards,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  'https://atrativefish.com.br/wp-content/uploads/2021/04/ocellaris-comum-peixe-palhaco-comum-300x300.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tucuna Free',
                        style: CustomTextStyles.cardsTitles,
                      ),
                      const Text(
                        'Santa Fé do Sul',
                        style: CustomTextStyles.cardsSubTitles,
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.date_range,
                              color: CoresPersonalizada.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '20/09/2023',
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: CoresPersonalizada.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Virtual',
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.group,
                              color: CoresPersonalizada.corPrimariaIcones,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Equipes',
                              style: CustomTextStyles.cardsTexts,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}