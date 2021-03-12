import 'package:flutter/material.dart';
import 'package:restaurants/account/account_utils.dart';
import 'package:restaurants/r_colors.dart';


class RegisterUserView extends StatelessWidget {
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
              Container(
                color: RColors.purpleAccent,
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    AccountUtils.textButton,
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
