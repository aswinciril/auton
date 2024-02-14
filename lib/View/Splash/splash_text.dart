import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashText extends StatefulWidget {
  const SplashText({super.key});

  @override
  _SplashTextState createState() => _SplashTextState();
}

class _SplashTextState extends State<SplashText> {
  double opacity = 0.0;
  @override
  void initState() {
    super.initState();
    // Start the animation on initState
    animate();
  }

  void animate() async {
    // Delay the animation by a few seconds for a "slow" effect
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2), // Adjust the duration as needed
      opacity: opacity,
      child: const AppTitle(color: Color.fromARGB(255, 249, 115, 108)),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Auton",
      style: GoogleFonts.risque(
        textStyle:
            TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
