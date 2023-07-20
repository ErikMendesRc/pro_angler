import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_angler/Util/Validators/login_validator.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Util/custom_styles.dart';
import 'package:pro_angler/Widgets/LoginPage/logo_image.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

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
                TextFormField(
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
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                TextFormField(
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
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _fazerLoginComEmail(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CoresPersonalizada.corSecundaria,
                    minimumSize: const Size(200, 40),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),
                // const Text("Ou entre com:", style: CustomTextStyles.destaque14Bold),
                // const SizedBox(height: 8.0),
                // ElevatedButton.icon(
                //   onPressed: () => _fazerLoginComGoogle(context),
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: const Size(100,40),
                //     backgroundColor: Colors.red, // Cor do botão
                //   ),
                //   icon:
                //       const FaIcon(FontAwesomeIcons.google), // Ícone do Google
                //   label: const Text('Login com o Google'), // Texto do botão
                // ),
                // const SizedBox(height: 8.0),
                const Text("Ou Registre-se agora:", style: CustomTextStyles.destaque14Bold),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Registre-se',
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

  void _fazerLoginComEmail(BuildContext context) async {
    final email = _emailController.text.trim();
    final senha = _passwordController.text;

    final emailError = FirebaseAuthValidator.validateEmail(email);
    final senhaError = FirebaseAuthValidator.validatePassword(senha);

    if (emailError != null) {
      _mostrarSnackBar(context, emailError);
      return;
    }

    if (senhaError != null) {
      _mostrarSnackBar(context, senhaError);
      return;
    }

    final loginError =
        await FirebaseAuthValidator.signInWithEmailAndPassword(email, senha);
    if (loginError != null) {
      _mostrarSnackBar(context, loginError);
      return;
    }

    _navegarParaPaginaInicial(context);
  }

  void _navegarParaPaginaInicial(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/homepage', (_) => false);
  }

  void _mostrarSnackBar(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.redAccent,
    ));
  }

  // Future<void> _fazerLoginComGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       return;
  //     }
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     if (userCredential.user != null) {
  //       _navegarParaPaginaInicial(context);
  //     } else {
  //       _mostrarSnackBar(context, 'Falha ao fazer login com o Google.');
  //     }
  //   } catch (e) {
  //     _mostrarSnackBar(context, 'Erro ao fazer login com o Google: $e');
  //   }
  // }
}
