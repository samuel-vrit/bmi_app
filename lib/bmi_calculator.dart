import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final int height;
  final double weight;
  double bmi = 0;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }

  String getBmiGrade() {
    if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestion() {
    if (bmi > 25) {
      return 'Your body is overweight. Please exercise more and eat less.';
    } else if (bmi > 18) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'Your body is underweight. Please eat more.';
    }
  }

  Color getGradeColor() {
    if (bmi > 25) {
      return Colors.red;
    } else if (bmi > 18) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
