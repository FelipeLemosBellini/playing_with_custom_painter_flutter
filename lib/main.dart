import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/colors.dart';
import 'package:playing_with_custom_paint/generator_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GeneratorModel generatorModel;

  void _updateRandomValues(size) => setState(() => generatorModel = GeneratorModel(size: size));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    generatorModel = GeneratorModel(size: size.width);
    return Scaffold(
        backgroundColor: CustomColors.backgroundDark,
        body: Center(
            child: SizedBox(
                width: size.width,
                height: size.width,
                child: CustomPaint(painter: RectangleCustom(generatorModel: generatorModel)))),
        floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColors.backgroundFAB,
            onPressed: () => _updateRandomValues(size.width),
            child: const Icon(Icons.refresh_outlined)));
  }
}

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
