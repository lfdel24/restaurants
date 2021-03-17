import 'package:flutter/foundation.dart';

class RegisterUserController extends ChangeNotifier {
  bool _showPass = false;

  bool get showPass => _showPass;

  void changeShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  void save({String name = "", String email = "", String pass = ""}) {
    print("Ok");
  }
}
