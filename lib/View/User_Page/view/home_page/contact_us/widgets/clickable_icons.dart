import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickableIcons extends StatelessWidget {
  const ClickableIcons({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          size: 30,
          color: Color.fromARGB(255, 141, 219, 233),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.akayaKanadaka(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    );
  }
}
