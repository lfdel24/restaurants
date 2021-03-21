import 'package:flutter/material.dart';
import 'package:restaurants/account/view/register_user_view.dart';
import 'package:restaurants/account/view/user_guest_view.dart';

class AccountView extends StatelessWidget {

  final bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return RegisterUserView();
  }
}


