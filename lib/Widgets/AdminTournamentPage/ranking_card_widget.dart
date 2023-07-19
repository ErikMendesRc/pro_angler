import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';

class RankingCardWidget extends StatelessWidget {
  final int rank;
  final int index;

  const RankingCardWidget({super.key, 
    required this.rank,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('clicado');
      },
      child: Card(
        color: CoresPersonalizada.corSecundaria,
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('caminho/para/a/foto_do_participante.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: 50.0,
            height: 50.0,
          ),
          title: const Text('Erik',
          style: CustomTextStyles.texto16Bold),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
               SizedBox(height: 8.0),
               Text('Nº de Inscrição: 12345',
               style: CustomTextStyles.texto14Normal),
               SizedBox(height: 8.0),
               Text('Cidade: São Paulo',
               style: CustomTextStyles.texto14Normal),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${rank}º Lugar',
                style: CustomTextStyles.texto12BrancoBold,
              ),
              const SizedBox(height: 4.0),
              const Text('Pts: 175.5cm',
              style: CustomTextStyles.texto12Branco,),
            ],
          ),
        ),
      ),
    );
  }
}