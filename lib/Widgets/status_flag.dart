import 'package:flutter/material.dart';

class StatusFlag extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const StatusFlag({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    String status;
    IconData statusIcon;
    Color statusColor;
    if (currentDate.isBefore(startDate)) {
      status = 'Inscrições Abertas';
      statusIcon = Icons.check_circle;
      statusColor = Colors.green;
    } else if (currentDate.isBefore(endDate)) {
      status = 'Em Andamento';
      statusIcon = Icons.schedule;
      statusColor = Colors.grey;
    } else {
      status = 'Finalizado';
      statusIcon = Icons.close;
      statusColor = Colors.red;
    }

    return Row(
      children: [
        Icon(
          statusIcon,
          color: statusColor,
        ),
        const SizedBox(width: 8),
        Text(
          status,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}