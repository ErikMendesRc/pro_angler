import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Lógica de redirecionamento para outra página
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
                        style: TextStyle(
                          color: CoresPersonalizada.corPrimariaTexto,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Santa Fé do Sul',
                        style: TextStyle(
                          color: CoresPersonalizada.corPrimariaTexto,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: const [
                          Icon(
                            Icons.date_range,
                            color: CoresPersonalizada.corPrimariaTexto,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '20/09/2023',
                            style: TextStyle(
                              color: CoresPersonalizada.corPrimariaTexto,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: CoresPersonalizada.corPrimariaTexto,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Virtual',
                            style: TextStyle(
                              color: CoresPersonalizada.corPrimariaTexto,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.group,
                            color: CoresPersonalizada.corPrimariaIcones,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Equipes',
                            style: TextStyle(
                              color: CoresPersonalizada.corPrimariaTexto,
                            ),
                          ),
                        ],
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

