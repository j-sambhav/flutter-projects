import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReuseCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colour),
      ),
    );
  }
}
