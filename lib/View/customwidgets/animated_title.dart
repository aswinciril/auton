import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  HomeTitle({
    super.key,
  });

  final colorizeColors = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 194, 220, 242),
    Color.fromARGB(255, 238, 238, 238),
    const Color.fromARGB(255, 255, 214, 211),
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 31.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'Auton',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
          speed: const Duration(seconds: 2),
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
    );
  }
}
