import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/Validators/signup_validator.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/SignUpPage/logo_image.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    void _mostrarSnackBar(BuildContext context, String mensagem) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    void _mostrarToast(String mensagem) {
      Fluttertoast.showToast(
        msg: mensagem,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }

    void _navegarParaPaginaDeLogin(BuildContext context) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
    }

    void _registerWithEmail(BuildContext context) async {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      // Validar e-mail e senha
      final emailError = SignupValidator.validateEmail(email);
      final passwordError = SignupValidator.validatePassword(password);
      final confirmPasswordError =
          SignupValidator.validateConfirmPassword(password, confirmPassword);

      if (emailError != null) {
        _mostrarSnackBar(context, emailError);
        return;
      }

      if (passwordError != null) {
        _mostrarSnackBar(context, passwordError);
        return;
      }

      if (confirmPasswordError != null) {
        _mostrarSnackBar(context, confirmPasswordError);
        return;
      }

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final userData = UserData(
          id: userCredential.user!.uid,
          name: '',
          email: email,
          photoURL: '',
          championTrophys: [],
          personalAchiviements: [],
          myTournamentsIds: [],
          city: '',
          participatingTournaments: [],
          myCatches: [],
        );

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userData);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userData.id)
            .set(userData.toJson());

        _mostrarToast('Cadastro realizado com sucesso!');
        _navegarParaPaginaDeLogin(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _mostrarSnackBar(context, 'A senha é muito fraca.');
        } else if (e.code == 'email-already-in-use') {
          _mostrarSnackBar(
              context, 'Este e-mail já está sendo usado por outra conta.');
        } else {
          _mostrarSnackBar(context, 'Erro ao criar a conta: $e');
        }
      } catch (e) {
        _mostrarSnackBar(context, 'Erro ao criar a conta: $e');
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria
            ],
            center: Alignment.center,
            radius: 1.0,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoImage(),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um e-mail.';
                    }
                    if (!value.contains('@')) {
                      return 'E-mail inválido.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Senha',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha.';
                    }
                    if (value.length < 6) {
                      return 'A senha deve conter pelo menos 6 caracteres.';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, repita a senha.';
                    }
                    if (value != _passwordController.text) {
                      return 'As senhas não correspondem.';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _registerWithEmail(context),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _registerWithEmail(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Cadastrar'),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Já tem uma conta? Entre',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
