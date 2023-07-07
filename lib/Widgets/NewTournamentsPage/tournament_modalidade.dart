import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentModalidadeFormField extends StatelessWidget {
  const TournamentModalidadeFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Modalidade',
        prefixIcon: Icon(Icons.sports, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
      items: const [
        DropdownMenuItem(value: '1', child: Text('Barco', style: TextStyle(color: CoresPersonalizada.white))),
        DropdownMenuItem(value: '2', child: Text('Caiaque', style: TextStyle(color: CoresPersonalizada.white))),
        DropdownMenuItem(value: '3', child: Text('Pesqueiro', style: TextStyle(color: CoresPersonalizada.white))),
      ],
      dropdownColor: CoresPersonalizada.corPrimaria,
      onChanged: (value) {},
    );
  }
}