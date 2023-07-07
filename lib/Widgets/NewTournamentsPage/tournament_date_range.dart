import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_angler/Util/cores.dart';

class TournamentDateRangeFormField extends StatefulWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  const TournamentDateRangeFormField({
    Key? key,
    required this.startDateController,
    required this.endDateController,
  }) : super(key: key);

  @override
  _TournamentDateRangeFormFieldState createState() => _TournamentDateRangeFormFieldState();
}

class _TournamentDateRangeFormFieldState extends State<TournamentDateRangeFormField> {
  bool _isEndDateInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: const TextStyle(color: CoresPersonalizada.white),
            decoration: const InputDecoration(
              labelText: 'Data Inicial',
              prefixIcon: Icon(Icons.calendar_today, color: CoresPersonalizada.white),
              labelStyle: TextStyle(color: CoresPersonalizada.white),
            ),
            controller: widget.startDateController,
            onTap: () async {
              final DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
                widget.startDateController.text = formattedDate;
                _validateDates(); // Chama a função para validar as datas
              }
            },
            readOnly: true,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextFormField(
            style: TextStyle(
              color: CoresPersonalizada.white,
              decorationColor: _isEndDateInvalid ? Colors.red : null,
            ),
            decoration: InputDecoration(
              labelText: 'Data Final',
              prefixIcon: Icon(Icons.calendar_today, color: CoresPersonalizada.white),
              labelStyle: TextStyle(color: CoresPersonalizada.white),
              errorText: _isEndDateInvalid ? 'Data final deve ser posterior à data inicial' : null,
            ),
            controller: widget.endDateController,
            onTap: () async {
              final DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
                widget.endDateController.text = formattedDate;
                _validateDates(); // Chama a função para validar as datas
              }
            },
            readOnly: true,
          ),
        ),
      ],
    );
  }

  void _validateDates() {
    final startDate = widget.startDateController.text;
    final endDate = widget.endDateController.text;

    if (startDate.isNotEmpty && endDate.isNotEmpty) {
      final startDateFormatted = DateFormat('dd/MM/yyyy').parse(startDate);
      final endDateFormatted = DateFormat('dd/MM/yyyy').parse(endDate);

      if (endDateFormatted.isBefore(startDateFormatted)) {
        setState(() {
          _isEndDateInvalid = true;
        });
      } else {
        setState(() {
          _isEndDateInvalid = false;
        });
      }
    }
  }
}