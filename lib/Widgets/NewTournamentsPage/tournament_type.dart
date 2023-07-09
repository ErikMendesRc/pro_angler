import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentTypeFormField extends StatelessWidget {
  const TournamentTypeFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Tipo do Torneio',
        prefixIcon: Icon(Icons.category, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
      items: const [
        DropdownMenuItem(value: '1', child: Text('Presencial', style: TextStyle(color: CoresPersonalizada.white))),
        DropdownMenuItem(value: '2', child: Text('Online', style: TextStyle(color: CoresPersonalizada.white))), 
        DropdownMenuItem(value: '3', child: Text('Presencial/Online', style: TextStyle(color: CoresPersonalizada.white))), 
      ],
      dropdownColor: CoresPersonalizada.corPrimaria,
      onChanged: (value) {},
    );
  }
}