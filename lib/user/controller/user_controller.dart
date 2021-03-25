import 'package:flutter/material.dart';
import 'package:restaurants/user/model/user_model.dart';
import 'package:restaurants/user/service/user_service.dart';

class UserController extends ChangeNotifier {
  UserModel _user = UserModel();
  bool _showPass = true;

  bool get showPass => _showPass;
  UserModel get user => _user;

  void changeShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  Future<String> createUser(
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
      notifyListeners();
      return "Cuenta creada con éxito";
    }
    notifyListeners();
    return "Correo y/o contraseña incorrecta";
  }

  void login({required String mail, required String pass}) async {
    _user = await UserService().login(mail: mail, pass: pass);
    print(_user);
  }

  void picker(BuildContext context) async {
    //bool resp = await UserService().uploadImage(result.path);
  }
}
