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

  bool save(
      TextEditingController controllerName,
      TextEditingController controllerEmail,
      TextEditingController controllerPass) {
    final user = UserModel(
        "", controllerName.text, controllerEmail.text, controllerPass.text);
    return UserService().create(user);
  }
}
