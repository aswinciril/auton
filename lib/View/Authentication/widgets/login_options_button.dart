import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginOptionsButton extends StatelessWidget {
  const LoginOptionsButton({
    super.key,
    required this.onpressed,
    required this.animation,
    required this.width,
  });

  final Function() onpressed;
  final String animation;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 252, 252, 252),
        onPrimary: Color.fromARGB(255, 11, 0, 74),
        minimumSize: Size(width, 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Lottie.asset(animation, height: 60, width: 80),
    );
  }
}
