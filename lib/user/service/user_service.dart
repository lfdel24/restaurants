import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restaurants/custom_widgets/utilities.dart';
import 'package:restaurants/user/model/user_model.dart';

class UserService {
  Future<bool> create(UserModel user) async {
    try {
      Response response =
          await Dio().post("$baseUrl/user/save", data: user.toJson());
      print(response);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<UserModel> login({required String email, required String pass}) async {
    try {
      Response response = await Dio()
          .post("$baseUrl/user/login", data: {"email": email, "pass": pass});
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return UserModel(id: 0, name: "", email: "", pass: "");
  }

  Future<bool> uploadImage(String path) async {
    try {
      File file = File(path);
      String fileName = file.path.split('/').last;
      print(file.path);
      print(file.absolute.path);
      print(fileName);
      var data = await FormData.fromMap({
        "file": await MultipartFile.fromFile(path, filename: fileName),
      });

      Response response = await Dio().post("$baseUrl/file/upload", data: data);
      print(response);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
