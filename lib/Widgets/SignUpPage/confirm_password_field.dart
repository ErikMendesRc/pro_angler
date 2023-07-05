import 'package:flutter/material.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  const ConfirmPasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Repetir Senha',
        prefixIcon: Icon(Icons.lock, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
        prefixStyle: TextStyle(color: Colors.white),
      ),
      obscureText: true,
    );
  }
}