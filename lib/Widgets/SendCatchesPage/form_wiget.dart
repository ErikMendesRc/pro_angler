import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_angler/Util/cores.dart';
import '../../Util/fish_especies.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
    required this.checkFieldsFilled,
  }) : super(key: key);

  final VoidCallback checkFieldsFilled;

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  FishSpecies? selectedSpecies;
  List<FishSpecies> speciesList = FishSpecies.speciesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        DropdownButtonFormField<FishSpecies>(
          dropdownColor: CoresPersonalizada.corPrimaria,
          value: selectedSpecies, 
          style: const TextStyle(color: CoresPersonalizada.white),
          decoration: const InputDecoration(
            labelText: 'Espécie do Peixe',
            hintText: 'Selecione a espécie do peixe',
            labelStyle: TextStyle(color: CoresPersonalizada.white),
            hintStyle: TextStyle(color: CoresPersonalizada.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
          ),
          items: speciesList.map((species) {
            return DropdownMenuItem(
              value: species,
              child: Text(
                species.name,
                style: const TextStyle(color: CoresPersonalizada.white),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedSpecies = value;
            });
            widget.checkFieldsFilled();
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: CoresPersonalizada.white),
          decoration: const InputDecoration(
            labelText: 'Tamanho do Peixe (CM)',
            hintText: 'Digite o tamanho do peixe',
            labelStyle: TextStyle(color: CoresPersonalizada.white),
            hintStyle: TextStyle(color: CoresPersonalizada.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          onChanged: (_) => widget.checkFieldsFilled(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  hintText: 'Digite o nome do estado',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  hintStyle: TextStyle(color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                onChanged: (_) => widget.checkFieldsFilled(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                  hintText: 'Digite o nome da cidade',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  hintStyle: TextStyle(color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                onChanged: (_) => widget.checkFieldsFilled(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: CoresPersonalizada.white),
          decoration: const InputDecoration(
            labelText: 'Descrição da Captura',
            hintText: 'Digite uma descrição da captura',
            labelStyle: TextStyle(color: CoresPersonalizada.white),
            hintStyle: TextStyle(color: CoresPersonalizada.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
          ),
          maxLines: 3,
          onChanged: (_) => widget.checkFieldsFilled(),
        ),
      ],
    );
  }
}