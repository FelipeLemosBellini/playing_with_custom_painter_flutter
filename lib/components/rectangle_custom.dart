import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/models/generator_model.dart';
class RectangleCustom extends CustomPainter {
  GeneratorModel generatorModel;

  RectangleCustom({required this.generatorModel});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = generatorModel.randomColor
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.width / 2),
        width: generatorModel.randomWidth,
        height: generatorModel.randomHeight);

    final roundedRect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));

    canvas.drawRRect(roundedRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
