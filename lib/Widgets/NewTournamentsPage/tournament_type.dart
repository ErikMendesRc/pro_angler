import 'package:flutter/material.dart';

class TournamentTypeFormField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  TournamentTypeFormField({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TournamentTypeFormFieldState createState() =>
      _TournamentTypeFormFieldState();
}

class _TournamentTypeFormFieldState extends State<TournamentTypeFormField> {
  String _selectedType = "presencial";

  @override
  void initState() {
    super.initState();
    _selectedType = widget.value;
  }

  String? _validateType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, escolha o tipo do Torneio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedType,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Escolha o tipo do Torneio',
        prefixIcon: Icon(Icons.category, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      items: const [
        DropdownMenuItem(
          value: 'presencial',
          child:
              Text('Torneio Presencial', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: 'online',
          child: Text('Torneio Online', style: TextStyle(color: Colors.white)),
        ),
      ],
      dropdownColor: Colors.blue,
      onChanged: (value) {
        setState(() {
          _selectedType = value!;
        });
        widget.onChanged(value!);
      },
      validator: _validateType,
    );
  }
}