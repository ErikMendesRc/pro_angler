class SignupValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'O campo de e-mail não pode estar vazio.';
    } else if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'O campo de senha não pode estar vazio.';
    } else if (password.length < 8) {
      return 'A senha deve conter pelo menos 8 caracteres.';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$').hasMatch(password)) {
      return 'A senha deve conter pelo menos uma letra maiúscula, uma letra minúscula, um dígito e um caractere especial.';
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Por favor, repita a senha.';
    } else if (password != confirmPassword) {
      return 'As senhas não correspondem.';
    }
    return null;
  }
}

