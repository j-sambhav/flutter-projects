import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  int height;
  int weight;
  double _bMI;

  String calculateBMI() {
    _bMI = weight / pow(height / 100, 2);
    return _bMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_bMI < 18) {
      return 'UNDERWEIGHT';
    }
    if (_bMI > 25) {
      return 'OVERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String getInterpretations() {
    if (_bMI < 18) {
      return 'You have a lower body weight. Eat a little more.';
    }
    if (_bMI > 25) {
      return ' You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a normal body weight. Keep it up!';
    }
  }
}
