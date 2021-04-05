import 'package:flutter/material.dart';

import '../colors.dart';

void customSnackBar(BuildContext context, String title) {
  final snackBar = SnackBar(
      content: Text(title),
      action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () {},
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget customMaterialButton(
    BuildContext context, String label, Function onPressed) {
  return Container(
    margin: EdgeInsets.all(8),
    color: purpleAccent,
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: Colors.white),
      ),
    ),
  );
}
