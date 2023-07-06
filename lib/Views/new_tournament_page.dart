import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewTournamentPage extends StatefulWidget {
  const NewTournamentPage({super.key});

  @override
  _NewTournamentPageState createState() => _NewTournamentPageState();
}

class _NewTournamentPageState extends State<NewTournamentPage> {
  bool _hasEntryFee = false;
  bool _acceptTerms = false;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _entryFeeController = TextEditingController();
  final picker = ImagePicker();
  File? _pickedImage;

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _entryFeeController.dispose();
    super.dispose();
  }

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Torneios'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: getImage,
                child: Container(
                  height: 200.0,
                  color: Colors.grey,
                  child: _pickedImage != null
                      ? Image.file(
                          _pickedImage!,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.upload_file),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome do Torneio',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Data Inicial',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: _startDateController,
                      onTap: () async {
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          final formattedDate =
                              DateFormat('dd/MM/yyyy').format(selectedDate);
                          setState(() {
                            _startDateController.text = formattedDate;
                          });
                        }
                      },
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Data Final',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: _endDateController,
                      onTap: () async {
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          final formattedDate =
                              DateFormat('dd/MM/yyyy').format(selectedDate);
                          setState(() {
                            _endDateController.text = formattedDate;
                          });
                        }
                      },
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Modalidade',
                  prefixIcon: Icon(Icons.sports),
                ),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Modalidade 1')),
                  DropdownMenuItem(value: '2', child: Text('Modalidade 2')),
                  DropdownMenuItem(value: '3', child: Text('Modalidade 3')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo do Torneio',
                  prefixIcon: Icon(Icons.category),
                ),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Tipo 1')),
                  DropdownMenuItem(value: '2', child: Text('Tipo 2')),
                  DropdownMenuItem(value: '3', child: Text('Tipo 3')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              SwitchListTile(
                title: const Text('Possui taxa de inscrição?'),
                value: _hasEntryFee,
                onChanged: (value) {
                  setState(() {
                    _hasEntryFee = value;
                  });
                },
              ),
              if (_hasEntryFee)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Valor da Inscrição',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  controller: _entryFeeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    final formattedValue = NumberFormat.currency(
                      symbol: 'R\$',
                      decimalDigits: 2,
                      locale: 'pt_BR',
                    ).format(double.parse(value) /
                        100); // Dividir por 100 para ajustar as casas decimais
                    _entryFeeController.value =
                        _entryFeeController.value.copyWith(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                          offset: formattedValue.length),
                    );
                  },
                ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                  ),
                  const Text('Aceito os Termos e Condições'),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _acceptTerms ? () => _createTournament() : null,
                child: const Text('Criar Torneio'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTournament() {
    // Implement your logic to create the tournament
  }
}
