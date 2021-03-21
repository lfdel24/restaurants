import 'package:dio/dio.dart';
import 'package:restaurants/model/user_model.dart';

class UserService {
  String _url = "http://localhost:8080";

  Future<bool> create(UserModel user) async {
    Response response;
    try {
      Response response =
          await Dio().post("$_url/users/save", data: user.toJson());
      print(response);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
