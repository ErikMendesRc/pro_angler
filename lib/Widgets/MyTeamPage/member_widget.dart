import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:provider/provider.dart';

import '../../Providers/team_provider.dart';

class MembersWidget extends StatelessWidget {
  const MembersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    final members = teamProvider.team?.participants ?? [];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Membros da Equipe',
                style: CustomTextStyles.text20Bold
              ),
              GestureDetector(
                onTap: () {
                  // Ação ao tocar em "Adicionar Membro"
                },
                child: const Text(
                  'Adicionar Membro',
                  style: CustomTextStyles.destaque14Bold
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: members.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Ação ao tocar no card, por exemplo, abrir o perfil do membro
                },
                child: Card(
                  color: CoresPersonalizada.corPrimaria,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.network(
                                  members[index].photo ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  members[index].name,
                                  style: CustomTextStyles.destaque14Bold
                                ),
                                Text(
                                  members[index].city,
                                  style: CustomTextStyles.texto12Branco
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          'Ver Perfil',
                          style: CustomTextStyles.texto12BrancoBold
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
