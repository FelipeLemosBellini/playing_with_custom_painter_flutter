import 'package:flutter/material.dart';
import 'dart:math';

class GeneratorModel {
  double size;
  late final Color _randomColor;
  late final double _randomWidth;
  late final double _randomHeight;

  GeneratorModel({required this.size}) {
    _randomColor = _generateRandomColor();
    _randomWidth = _generateRandomSize();
    _randomHeight = _generateRandomSize();
  }

  Color get randomColor => _randomColor;

  double get randomWidth => _randomWidth;

  double get randomHeight => _randomHeight;

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
