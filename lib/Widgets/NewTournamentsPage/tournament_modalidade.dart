import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TournamentModalidadeFormField extends StatelessWidget {
  final ValueNotifier<String?> controller;

  TournamentModalidadeFormField({Key? key, required this.controller})
      : super(key: key);

  String? _validateModalidade(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, escolha a modalidade do Torneio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: controller.value,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Escolha a modalidade do Torneio',
        prefixIcon: Icon(Icons.sports, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      items: _buildDropdownItems(),
      dropdownColor: Colors.blue,
      onChanged: (value) {
        controller.value = value;
      },
      validator: _validateModalidade,
    );
  }

  static List<DropdownMenuItem<String>> _buildDropdownItems() {
    return [
      _buildDropdownItem('barco', 'Torneio de Barco'),
      _buildDropdownItem('caiaque', 'Torneio de Caiaque'),
      _buildDropdownItem('pesqueiro', 'Pesqueiro'),
    ];
  }

  static DropdownMenuItem<String> _buildDropdownItem(
      String value, String label) {
    return DropdownMenuItem(
      value: value,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}