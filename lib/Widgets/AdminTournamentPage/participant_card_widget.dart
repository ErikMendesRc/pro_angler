import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class ParticipantCardWidget extends StatelessWidget {
  final String participantName;
  final String participantCity;
  final String participantPhoto;

  const ParticipantCardWidget({super.key, 
    required this.participantName,
    required this.participantCity,
    required this.participantPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CoresPersonalizada.corSecundaria,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(participantPhoto),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: 50.0,
          height: 50.0,
        ),
        title: Text(participantName,
        style: CustomTextStyles.texto16Bold),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text('Cidade: $participantCity',
            style: CustomTextStyles.texto14Normal,),
          ],
        ),
        trailing: const Text('Ver Perfil',
        style: CustomTextStyles.destaque14Bold),
      ),
    );
  }
}