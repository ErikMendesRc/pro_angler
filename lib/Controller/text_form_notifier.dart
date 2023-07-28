import 'package:flutter/material.dart';

class TextEditingControllerNotifier extends ValueNotifier<String> {
  TextEditingControllerNotifier(String value) : super(value);

  static TextEditingControllerNotifier fromController(
      TextEditingController controller) {
    return TextEditingControllerNotifier(controller.text);
  }

  TextEditingController toController() {
    return TextEditingController(text: value);
  }
}
