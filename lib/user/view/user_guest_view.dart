import 'package:flutter/material.dart';
import 'package:restaurants/custom_widgets/custom_widgets.dart';
import 'package:restaurants/user/account_utils.dart';
import 'package:restaurants/user/view/user_options_view.dart';

class UserGuestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AccountUtils.account,
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 45),
              Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 20),
              Text(AccountUtils.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Text(
                AccountUtils.subTitle,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 18),
              customMaterialButton(context, "Continuar", () {
                print("sldfpsmfsmfs OK");
                push(context, UserOptionsView());
              })
            ],
          ),
        ));
  }
}
