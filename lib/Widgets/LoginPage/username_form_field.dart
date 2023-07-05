import 'package:flutter/material.dart';

class UsernameFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Nome de usuário',
        prefixIcon: Icon(Icons.person, color: Colors.white),
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