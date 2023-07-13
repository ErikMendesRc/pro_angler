import 'package:flutter/material.dart';

class RegisterFloatingActionButton extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final VoidCallback? onPressed;

  const RegisterFloatingActionButton({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    bool isRegistrationOpen = false;

    if (startDate != null && currentDate.isBefore(startDate!)) {
      isRegistrationOpen = true;
    }

    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: isRegistrationOpen
            ? () {
                if (onPressed != null) {
                  Navigator.pushNamed(context, '/inscriptionPage');
                }
              }
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isRegistrationOpen ? Colors.red : Colors.grey,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          isRegistrationOpen ? 'Fazer Inscrição' : 'Inscrições Encerradas',
        ),
      ),
    );
  }
}
