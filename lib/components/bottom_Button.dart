import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTab;
  final String text;
  BottomButton({@required this.onTab, @required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        color: Color(kBottonContainerColor),
        child: Center(
          child: Center(
            child: Text(
              text,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomConatinerHeight,
      ),
    );
  }
}
