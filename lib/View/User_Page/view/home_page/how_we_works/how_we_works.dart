import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowWeWorks extends StatelessWidget {
  const HowWeWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              " How We Works",
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 5, 0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
