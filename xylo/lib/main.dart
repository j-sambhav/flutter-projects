import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded keyGen({int j, Color color}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(j);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            keyGen(j: 1, color: Colors.red),
            keyGen(j: 2, color: Colors.orange),
            keyGen(j: 3, color: Colors.yellow),
            keyGen(j: 4, color: Colors.green),
            keyGen(j: 5, color: Colors.teal),
            keyGen(j: 6, color: Colors.blue),
            keyGen(j: 7, color: Colors.indigo)
          ],
        )),
      ),
    );
  }
}
