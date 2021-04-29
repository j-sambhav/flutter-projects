import 'package:flutter/material.dart';
import 'mainpage.dart';

void main() {
  runApp(Cointick());
}

class Cointick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Coinpage(),
    );
  }
}
