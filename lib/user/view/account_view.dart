import 'package:flutter/material.dart';
import 'package:restaurants/user/view/user_options_view.dart';

class AccountView extends StatelessWidget {
  final bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    //return RegisterUserView();
    return UserOptionsView();
  }
}
