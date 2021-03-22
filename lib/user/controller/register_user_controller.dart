import 'package:flutter/material.dart';
import 'package:restaurants/model/user_model.dart';
import 'package:restaurants/service/user_service.dart';

class RegisterUserController extends ChangeNotifier {
  bool _showPass = true;

  bool get showPass => _showPass;

  void changeShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  Future<String> save(
      TextEditingController controllerName,
      TextEditingController controllerMail,
      TextEditingController controllerPass,
      FocusNode focusNode) async {
    final user = UserModel(
        id: 0,
        name: controllerName.text,
        mail: controllerMail.text,
        pass: controllerPass.text);
    var resp = await UserService().create(user);
    if (resp) {
      controllerName.text = "";
      controllerMail.text = "";
      controllerPass.text = "";
      focusNode.requestFocus();
      return "Cuenta creada con éxito";
    }
    return "Correo y/o contraseña incorrecta";
  }
}
