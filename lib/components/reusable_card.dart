import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function gestureAction;
  ReusableCard({@required this.colour, this.cardChild, this.gestureAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureAction,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
