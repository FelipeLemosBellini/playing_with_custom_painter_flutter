import 'package:flutter/material.dart';
import 'package:playing_with_custom_paint/pages/home_page.dart';

void main() => runApp(const PlayingWithCustomPainter());

class PlayingWithCustomPainter extends StatelessWidget {
  const PlayingWithCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
