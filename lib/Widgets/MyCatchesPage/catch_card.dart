import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class CatchCard extends StatelessWidget {
  final String fishPhoto;
  final String fishName;
  final String fishSize;
  final String fishLocation;
  final String tournamentName;
  final String validatedBy;

  const CatchCard(
      {super.key,
      required this.fishPhoto,
      required this.fishName,
      required this.fishSize,
      required this.fishLocation,
      required this.tournamentName,
      required this.validatedBy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: CoresPersonalizada.corSecundaria,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              fishPhoto,
              fit: BoxFit.cover,
              height: 150,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fishName,
                style: CustomTextStyles.texto16Bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Tamanho: $fishSize' ' cm',
              style: CustomTextStyles.texto12Branco),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Local: $fishLocation',
              style: CustomTextStyles.texto12Branco,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Torneio: $tournamentName',
              style: CustomTextStyles.texto12Branco,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                validatedBy == 'Aguardando...'
                    ? validatedBy
                    : 'Juiz: $validatedBy',
                style: TextStyle(
                  color:
                      validatedBy == 'Aguardando...' ? Colors.green : CoresPersonalizada.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
