import 'package:flutter/material.dart';
import 'package:restaurants/account/account_text.dart';
import 'package:restaurants/r_colors.dart';

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
              Text(AccountText.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Text(
                AccountText.subTitle,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 18),
              Container(
                color: RColors.purpleAccent,
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    AccountText.textButton,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
