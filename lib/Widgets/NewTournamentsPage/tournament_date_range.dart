import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TournamentDateRangeFormField extends StatefulWidget {
  final ValueChanged<Timestamp?>? onStartChanged;
  final ValueChanged<Timestamp?>? onEndChanged;

  const TournamentDateRangeFormField({
    Key? key,
    this.onStartChanged,
    this.onEndChanged,
  }) : super(key: key);

  @override
  _TournamentDateRangeFormFieldState createState() =>
      _TournamentDateRangeFormFieldState();
}

class _TournamentDateRangeFormFieldState
    extends State<TournamentDateRangeFormField> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  String? _validateStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a data de início.';
    }
    return null;
  }

  String? _validateEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a data de fim.';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller,
      ValueChanged<Timestamp?>? onDateChanged) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      final Timestamp timestamp = Timestamp.fromDate(picked);
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
      if (onDateChanged != null) {
        onDateChanged(timestamp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: startDateController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Data de Início',
            prefixIcon: Icon(Icons.date_range, color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
          validator: _validateStartDate,
          onTap: () {
            _selectDate(context, startDateController, widget.onStartChanged);
          },
        ),
        TextFormField(
          controller: endDateController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Data de Fim',
            prefixIcon: Icon(Icons.date_range, color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
          validator: _validateEndDate,
          onTap: () {
            _selectDate(context, endDateController, widget.onEndChanged);
          },
        ),
      ],
    );
  }
}