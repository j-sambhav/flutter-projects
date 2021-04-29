import 'package:flutter/material.dart';
import 'constants.dart';

class IconCard extends StatelessWidget {
  final String text;
  final IconData icon;
  IconCard({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(text, style: kLabelTextStyle),
        )
      ],
    );
  }
}
