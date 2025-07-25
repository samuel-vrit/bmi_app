import 'dart:math';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final int height;
  final double weight;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }
}
