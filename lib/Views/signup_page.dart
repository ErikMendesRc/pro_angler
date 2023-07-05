import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/SignUpPage/confirm_password_field.dart';
import 'package:pro_angler/Widgets/SignUpPage/email_form_field.dart';
import 'package:pro_angler/Widgets/SignUpPage/login_text.dart';
import 'package:pro_angler/Widgets/SignUpPage/logo_image.dart';
import 'package:pro_angler/Widgets/SignUpPage/password_form_field.dart';
import 'package:pro_angler/Widgets/SignUpPage/register_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
                const EmailFormField(),
                const SizedBox(height: 16),
                const PasswordFormField(),
                const SizedBox(height: 16),
                const ConfirmPasswordFormField(),
                const SizedBox(height: 16),
                const RegisterButton(),
                const SizedBox(height: 16),
                const LoginText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}