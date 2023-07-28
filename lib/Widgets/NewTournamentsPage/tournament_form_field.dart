import 'package:flutter/material.dart';

class TournamentNameFormField extends StatefulWidget {
  final TextEditingController controller;

  TournamentNameFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  _TournamentNameFormFieldState createState() =>
      _TournamentNameFormFieldState();
}

class _TournamentNameFormFieldState extends State<TournamentNameFormField> {
  String? _validateTournamentName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o nome do Torneio.';
    }
    return null;
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Informe o nome do Torneio',
        prefixIcon: Icon(Icons.badge, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      validator: _validateTournamentName, // Add the validator function here.
    );
  }
}
