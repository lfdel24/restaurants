import 'package:restaurants/user/model/user_model.dart';

class Login {
  UserModel _user = UserModel();

  //Private
  Login._();

  static final Login _instance = Login._();

  static Login get instance => _instance;

  static UserModel get user => _instance._user;
  static set user(UserModel user) => _instance._user;
}
