class CalculatorBrain {
  final int height, weight;

  CalculatorBrain(this.height, this.weight) {
    _bmi = weight * 10000 / ((height * height));
  }
  double _bmi;
  String getBmi() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretaion() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'you have normal body weight. good job';
    } else {
      return 'you have a lower than normal body weight. you can eat a bit more';
    }
  }
}
