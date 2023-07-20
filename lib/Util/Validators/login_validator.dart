import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'O campo de e-mail não pode estar vazio.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'O campo de senha não pode estar vazio.';
    } else if (password.length < 6) {
      return 'A senha deve conter pelo menos 6 caracteres.';
    }
    return null;
  }

  static Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Nenhum usuário encontrado para este e-mail.';
      } else if (e.code == 'wrong-password') {
        return 'Senha incorreta.';
      } else {
        return 'Erro ao fazer login: $e';
      }
    } catch (e) {
      return 'Erro ao fazer login: $e';
    }
  }
}