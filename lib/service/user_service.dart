import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restaurants/model/user_model.dart';
import 'package:simple_logger/simple_logger.dart';

class UserService {
  String _url = "http://localhost:8080";

  Future<bool> create(UserModel user) async {
    final logger = SimpleLogger();
    try {
      Response response =
          await Dio().post("$_url/users/save", data: user.toJson());
      logger.info(response);
      return true;
    } catch (e) {
      logger.warning(e);
    }
    return false;
  }

  Future<bool> uploadImage(String path) async {
    final logger = SimpleLogger();
    try {
      File file = File(path);
      String fileName = file.path.split('/').last;
      print(file.path);
      print(file.absolute.path);
      print(fileName);
      var data = await FormData.fromMap({
        "file": await MultipartFile.fromFile(path, filename: fileName),
      });

      Response response = await Dio().post("$_url/files/upload", data: data);
      logger.info(response);
      return true;
    } catch (e) {
      logger.warning(e);
    }
    return false;
  }
}
