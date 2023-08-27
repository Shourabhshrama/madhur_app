import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void>  moveScreen(BuildContext context,Widget newScreen) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => newScreen));
}