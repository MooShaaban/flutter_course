import 'package:flutter/material.dart';

Widget defaultButton ({
  required String text,
  Color backgroundColor = Colors.blue,
  required Function function,
  double height = 40.0,
  double width = double.infinity


}) {

     return MaterialButton(
        minWidth: width,
        height: height,
        child: Text(text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        color: backgroundColor,
        onPressed: function(),
      );
}