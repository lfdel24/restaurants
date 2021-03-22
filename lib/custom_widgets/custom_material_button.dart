import 'package:flutter/material.dart';

import '../r_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomMaterialButton(
      {Key? key, this.label = "", required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: RColors.purpleAccent,
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: () => onPressed,
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
}
