import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/helpers/colors.dart';
import 'package:playing_with_custom_paint/components/rectangle_custom.dart';
import 'package:playing_with_custom_paint/models/generator_model.dart';
import 'package:playing_with_custom_paint/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}
