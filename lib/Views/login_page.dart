import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/LoginPage/login_button.dart';
import 'package:pro_angler/Widgets/LoginPage/logo_image.dart';
import 'package:pro_angler/Widgets/LoginPage/password_form_field.dart';
import 'package:pro_angler/Widgets/LoginPage/register_text.dart';
import 'package:pro_angler/Widgets/LoginPage/username_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CoresPersonalizada.corPrimaria,
                CoresPersonalizada.corSecundaria,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoImage(),
                const SizedBox(height: 16),
                UsernameFormField(),
                const SizedBox(height: 16),
                const PasswordFormField(),
                const SizedBox(height: 16),
                const LoginButton(),
                const SizedBox(height: 16),
                RegisterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}