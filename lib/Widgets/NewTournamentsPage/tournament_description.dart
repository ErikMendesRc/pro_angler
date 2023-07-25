import 'package:flutter/material.dart';

class TournamentDescriptionFormField extends StatelessWidget {
  final TextEditingController controller;

  TournamentDescriptionFormField({Key? key, required this.controller})
      : super(key: key);

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, descreva os detalhes do torneio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Descreva os detalhes do torneio',
        prefixIcon: Icon(Icons.description, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      maxLines: 3,
      validator: _validateDescription,
    );
  }
}