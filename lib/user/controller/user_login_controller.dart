import 'package:flutter/material.dart';

class UserLoginController {
  final formState = GlobalKey<FormState>();
  final controllerMail = TextEditingController(text: "");
  final controllerPass = TextEditingController(text: "");
  final focusNodeMail = FocusNode();
  final focusNodePass = FocusNode();

  bool showPass = true;

  void changueShowPass() {
    showPass = !showPass;
  }

  void dispose() {
    controllerMail.dispose();
    controllerPass.dispose();
    focusNodeMail.dispose();
    focusNodePass.dispose();
  }
}
