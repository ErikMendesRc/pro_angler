import 'package:flutter/material.dart';
import 'package:pro_angler/Util/custom_styles.dart';

import 'package:flutter/material.dart';

class InfoTournamentWidget extends StatefulWidget {
  @override
  _InfoTournamentWidgetState createState() => _InfoTournamentWidgetState();
}

class _InfoTournamentWidgetState extends State<InfoTournamentWidget> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  String? _selectedModality;
  String? _selectedType;
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _modalities = [
    'Modalidade A',
    'Modalidade B',
    'Modalidade C'
  ];
  final List<String> _types = ['Tipo A', 'Tipo B', 'Tipo C'];

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Adicionando a chave do formulário

  @override
  void initState() {
    super.initState();
    // Recupere os dados do banco de dados e preencha os controladores
    _nameController.text = 'Nome do torneio do banco de dados';
    _selectedModality = _modalities.isNotEmpty ? _modalities.first : null;
    _selectedType = _types.isNotEmpty ? _types.first : null;
    _descriptionController.text = 'Descrição do torneio do banco de dados';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // Associando a chave do formulário
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Informações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                if (!_isEditing)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Text('Editar Informações',
                          style: CustomTextStyles.texto12Branco),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              style: CustomTextStyles.texto14Normal,
              controller: _nameController,
              enabled: _isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um nome válido.';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nome do Torneio',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            _buildDropdownFormField(
              _selectedModality,
              _modalities,
              _isEditing
                  ? (String? newValue) {
                      setState(() {
                        _selectedModality = newValue;
                      });
                    }
                  : null,
              'Modalidade do Torneio',
            ),
            const SizedBox(height: 8.0),
            _buildDropdownFormField(
              _selectedType,
              _types,
              _isEditing
                  ? (String? newValue) {
                      setState(() {
                        _selectedType = newValue;
                      });
                    }
                  : null,
              'Tipo do Torneio',
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              style: CustomTextStyles.texto14Normal,
              controller: _descriptionController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                labelText: 'Descrição do Torneio',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (_isEditing) const SizedBox(height: 16.0),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    setState(() {
                      _isEditing = false;
                      final String name = _nameController.text;
                      final String? modality = _selectedModality;
                      final String? type = _selectedType;
                      final String description = _descriptionController.text;
                    });
                  }
                },
                child: const Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownFormField(
    String? value,
    List<String> items,
    void Function(String?)? onChanged,
    String labelText,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
