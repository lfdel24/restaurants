import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/user/controller/user_controller.dart';
import 'package:restaurants/user/view/user_guest_view.dart';
import 'package:restaurants/user/view/user_login_view.dart';

class AccountView extends StatelessWidget {
  final bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserController>(context).user;
    if (user.isEmpty()) {
      return UserLoginView();
    }
    return UserGuestView();
  }
}
