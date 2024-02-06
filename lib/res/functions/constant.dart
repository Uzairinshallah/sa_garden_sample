import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double getMobileMaxheight(BuildContext context) =>
    MediaQuery.of(context).size.height;

Widget getSpace({double h = 0, double w = 0}) => SizedBox(
  height: h,
  width: w,
);


class Constants{
  static showSnackBar(BuildContext context, String message, {Color? color}) {
    color ??= Colors.red.withOpacity(.8);
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}