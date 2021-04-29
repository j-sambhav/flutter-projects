import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reuse_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.result,
      @required this.interpretationText,
      @required this.bMI});
  final String result;
  final String interpretationText;
  final String bMI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF24D876),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bMI,
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: double.infinity,
                    ),
                    Text(
                      interpretationText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                // cardChild: Column(
                // ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: kBottomContainerHeight,
                color: kBottomContainerColor,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                //padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: kLargeButtonText,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
