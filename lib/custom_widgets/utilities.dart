import 'package:flutter/material.dart';

final String baseUrl = "http://localhost:8080";
final marginHorizontal = EdgeInsets.symmetric(horizontal: 12);

void push(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
