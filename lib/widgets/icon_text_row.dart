import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'small_text.dart';

class IconAndTextRow extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double textSize;

  const IconAndTextRow(
      {Key? key,
      required this.icon,
      this.size = 32,
      this.iconColor = const Color(0xFF756d54),
      this.backgroundColor = const Color(0xFFfcf4e4),
      required this.text,
      this.textColor = Colors.black87,
      this.textSize = 16,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: size),
        SizedBox(width: dimen10 / 2),
        Padding(
            padding: EdgeInsets.only(top: dimen10 / 5),
            child: SmallText(
                text: text,
                color: textColor,
                fontWeight: fontWeight,
                size: textSize,
                textAlign: TextAlign.start))
      ],
    );
  }
}
