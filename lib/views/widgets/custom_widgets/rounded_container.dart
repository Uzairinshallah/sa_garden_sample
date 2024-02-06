import 'package:flutter/material.dart';

import '../../../res/functions/constant.dart';


class RoundContainer extends StatelessWidget {
  RoundContainer(
      {super.key, required this.widget, this.width, this.radius, this.image});
  Widget widget;
  String? image;
  double? width;
  double? radius;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 30.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: width ?? getMobileMaxWidth(context) * .8,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
        child: widget,
      ),
    );
  }
}
