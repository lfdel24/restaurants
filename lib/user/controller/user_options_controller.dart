import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurants/r_colors.dart';
import 'package:restaurants/service/user_service.dart';

class UserOptionsController {
  void picker(BuildContext context) async {
    var rootPath = await getTemporaryDirectory();
    String path = await FilesystemPicker.open(
      title: 'Open file',
      context: context,
      rootDirectory: rootPath,
      fsType: FilesystemType.file,
      folderIconColor: RColors.purpleAccent,
      fileTileSelectMode: FileTileSelectMode.checkButton,
      // requestPermission: () async =>
      //     await Permission.storage.request().isGranted
    );
    print("Path $path");
    bool resp = await UserService().uploadImage(path);
  }
}
