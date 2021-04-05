import 'package:flutter/material.dart';
import 'package:restaurants/custom_widgets/custom_widgets.dart';
import 'package:restaurants/custom_widgets/text.dart';
import 'package:restaurants/custom_widgets/utilities.dart';
import 'package:restaurants/g_k_login.dart';
import 'package:restaurants/user/model/Login.dart';
import 'package:restaurants/user/service/user_service.dart';
import 'package:restaurants/user/view/user_guest_view.dart';

class UserLoginController {
  final formState = GlobalKey<FormState>();
  final controllerEmail = TextEditingController(text: "");
  final controllerPass = TextEditingController(text: "");
  final focusNodeEmail = FocusNode();
  final focusNodePass = FocusNode();

  bool showPass = true;

  void changueShowPass() {
    showPass = !showPass;
  }

  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    focusNodeEmail.dispose();
    focusNodePass.dispose();
  }

  void login(BuildContext context) async {
    if (formState.currentState!.validate()) {
      Login.user = await UserService()
          .login(email: controllerEmail.text, pass: controllerPass.text);
      if (Login.user.isEmpty()) {
        customSnackBar(context, usuarioYOContrasenaIncorrecta);
      } else {
        push(context, UserGuestView());
      }
    }
  }
}
