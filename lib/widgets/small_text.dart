import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final TextOverflow overflow;
  double size;
  double height;
  TextAlign? textAlign;
  bool? softWarp;
  int? maxLine;
  final TextDecoration? decoration;
  FontWeight fontWeight;

  SmallText(
      {Key? key,
      this.color = Colors.black87,
      required this.text,
      this.size = 14,
      this.height = 1.7,
      this.maxLine = 1,
      this.overflow = TextOverflow.ellipsis,
      this.softWarp = true,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLine,
        softWrap: softWarp,
        style: TextStyle(
            fontSize: size,
            color: color,
            height: height,
            letterSpacing: 0.3,
            decoration: decoration,
            fontWeight: fontWeight),
        overflow: overflow);
  }
}
