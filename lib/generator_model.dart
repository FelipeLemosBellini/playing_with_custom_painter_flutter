import 'package:flutter/material.dart';
import 'dart:math';

class GeneratorModel {
  double size;

  GeneratorModel({required this.size});

  Color get randomColor => _generateRandomColor();

  double get randomWidth => _generateRandomSize();

  double get randomHeight => _generateRandomSize();

  double _generateRandomSize() {
    Random random = Random();
    return random.nextInt(size.toInt()).toDouble();
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
