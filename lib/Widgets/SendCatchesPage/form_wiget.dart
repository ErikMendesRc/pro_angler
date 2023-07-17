import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_angler/Util/cores.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.checkFieldsFilled,
  }) : super(key: key);

  final VoidCallback checkFieldsFilled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: CoresPersonalizada.white),
          decoration: const InputDecoration(
            labelText: 'Espécie do Peixe',
            hintText: 'Digite a espécie do peixe',
            labelStyle: TextStyle(color: CoresPersonalizada.white),
            hintStyle: TextStyle(color: CoresPersonalizada.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CoresPersonalizada.white),
            ),
          ),
          onChanged: (_) => checkFieldsFilled(),
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
          onChanged: (_) => checkFieldsFilled(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: CoresPersonalizada.white),
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  hintText: 'Selecione o estado',
                  labelStyle: TextStyle(color: CoresPersonalizada.white),
                  hintStyle: TextStyle(color: CoresPersonalizada.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CoresPersonalizada.white),
                  ),
                ),
                items: [
                  const DropdownMenuItem(
                    value: 'estado1',
                    child: Text(
                      'Estado 1',
                      style: TextStyle(color: CoresPersonalizada.white),
                    ),
                  ),
                  const DropdownMenuItem(
                    value: 'estado2',
                    child: Text(
                      'Estado 2',
                      style: TextStyle(color: CoresPersonalizada.white),
                    ),
                  ),
                  // Adicione mais itens de estado aqui
                ],
                onChanged: (_) => checkFieldsFilled(),
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
                onChanged: (_) => checkFieldsFilled(),
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
          onChanged: (_) => checkFieldsFilled(),
        ),
      ],
    );
  }
}