import 'package:flutter/material.dart';
import '../constants.dart';

const double IconSize = 80;
const double iconTextSpace = 15;

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String iconText;

  IconContent(this.iconData, this.iconText);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: IconSize,
        ),
        SizedBox(
          height: iconTextSpace,
        ),
        Text(
          iconText,
          style: kLableTextStyle,
        )
      ],
    );
  }
}
