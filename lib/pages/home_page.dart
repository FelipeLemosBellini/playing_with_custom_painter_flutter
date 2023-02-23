import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/helpers/colors.dart';
import 'package:playing_with_custom_paint/components/rectangle_custom.dart';
import 'package:playing_with_custom_paint/models/generator_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late GeneratorModel generatorModel;
  late AnimationController _controller;
  late Animation<double> _animationCreateRectangle;
  late Animation<double> _animationRotate;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animationCreateRectangle = Tween<double>(begin: 0.1, end: 1).animate(_controller);
    _animationRotate =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateRandomValues(size) {
    setState(() => generatorModel = GeneratorModel(size: size));
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    generatorModel = GeneratorModel(size: size.width);
    return Scaffold(
        backgroundColor: CustomColors.backgroundDark,
        body: Center(
            child: AnimatedBuilder(
                animation: _animationCreateRectangle,
                builder: (_, __) => RotationTransition(
                    turns: _animationRotate,
                    child: Transform.scale(
                        scale: _animationCreateRectangle.value,
                        child: SizedBox(
                            width: size.width,
                            height: size.width,
                            child: CustomPaint(painter: RectangleCustom(generatorModel: generatorModel))))))),
        floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColors.backgroundFAB,
            onPressed: () => _updateRandomValues(size.width),
            child: const Icon(Icons.refresh_outlined)));
  }
}
