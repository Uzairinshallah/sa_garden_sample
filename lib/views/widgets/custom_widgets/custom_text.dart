import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.size,
    this.maxLines,
    this.bold,
    this.color,
    this.textAlign,
    this.textStyle,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? size;
  final int? maxLines;
  final FontWeight? bold;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: (maxLines != null) ? maxLines : null,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          GoogleFonts.inter(
            color: color ?? Colors.black,
            fontSize: size,
            fontWeight: bold ?? FontWeight.w400,
          ),
    );
  }
}