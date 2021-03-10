import 'package:flutter/material.dart';
import 'package:restaurants/account/account_text.dart';

class UserGuestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AccountText.account,
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 1,
        ),
        body: Container(
          child: Column(
            children: [
              Image.asset("/logo.png"),
              Text(AccountText.title),
              Text(AccountText.subTitle),
              MaterialButton(
                onPressed: () {},
                child: Text(AccountText.textButton),
              )
            ],
          ),
        ));
  }
}
