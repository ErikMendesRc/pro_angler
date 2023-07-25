import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentEntryFeeFormField extends StatelessWidget {
  final TextEditingController entryFeeController;

  const TournamentEntryFeeFormField({
    Key? key,
    required this.entryFeeController,
  }) : super(key: key);

  String? _validateEntryFee(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a taxa de inscrição do torneio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: CoresPersonalizada.white),
      decoration: const InputDecoration(
        labelText: 'Informe a taxa de inscrição do torneio',
        prefixIcon: Icon(Icons.attach_money, color: CoresPersonalizada.white),
        labelStyle: TextStyle(color: CoresPersonalizada.white),
      ),
      controller: entryFeeController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        final formattedValue = NumberFormat.currency(
          symbol: 'R\$',
          decimalDigits: 2,
          locale: 'pt_BR',
        ).format(double.parse(value) / 100);
        entryFeeController.value = entryFeeController.value.copyWith(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );
      },
      validator: _validateEntryFee,
    );
  }
}
