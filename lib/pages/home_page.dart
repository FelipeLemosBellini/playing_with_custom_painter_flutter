import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/helpers/colors.dart';
import 'package:playing_with_custom_paint/components/rectangle_custom.dart';
import 'package:playing_with_custom_paint/models/generator_model.dart';

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
