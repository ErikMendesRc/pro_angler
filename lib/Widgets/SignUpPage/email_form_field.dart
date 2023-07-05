import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
        prefixStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}