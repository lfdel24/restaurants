import 'package:flutter/material.dart';

class RegisterUserController {
  late bool showPass;
  late String errorText;
  late Color colorError;
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPass;
  late FocusNode focusNode;

  void changeShowPass() {
    showPass = !showPass;
  }

  void init() {
    showPass = true;
    errorText = "";
    colorError = Colors.white;
    controllerName = TextEditingController(text: "");
    controllerEmail = TextEditingController(text: "");
    controllerPass = TextEditingController(text: "");
    focusNode = FocusNode();
  }

  void save() {
    print(controllerName.text);
    print(controllerEmail.text);
    print(controllerPass.text);
    errorText =
        "El nombre es obligatorio.\nEl email es obligatorio.\nLa contraseña es obligatoia.";
    colorError = Colors.red;
    focusNode.requestFocus();
  }

  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPass.dispose();
    focusNode.dispose();
  }
}
