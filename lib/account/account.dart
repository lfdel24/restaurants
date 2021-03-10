import 'package:flutter/material.dart';
import 'package:restaurants/account/user_guest.dart';

class AccountView extends StatelessWidget {

  final bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    return isLogged ? Placeholder() : UserGuestView();
  }
}


