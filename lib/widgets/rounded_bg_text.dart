import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import 'small_text.dart';

class RoundedBGText extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final IconData? icon;
  final FontWeight? fontWeight;

  const RoundedBGText(
      {Key? key,
      this.fontWeight = FontWeight.normal,
      required this.text,
      this.icon,
      required this.textColor,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        // borderRadius: BorderRadius.only(topRight: Radius.circular(dimen20),bottomLeft: Radius.circular(dimen20))
      ),
      padding: EdgeInsets.all(dimen10 / 2),
      child: Row(
        children: [
          Visibility(
            visible: icon!=null,
            child: Icon(
              icon,
              size: dimen20,
              color: Colors.white,
            ),
          ),
          SmallText(
              text: text,
              color: textColor,
              size: dimen14,
              fontWeight: fontWeight!,
              overflow: TextOverflow.visible,
              softWarp: false),
        ],
      ),
    );
  }
}
