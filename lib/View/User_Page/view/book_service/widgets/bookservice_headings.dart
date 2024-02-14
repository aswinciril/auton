import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BookServiceHeadings extends StatelessWidget {
  BookServiceHeadings({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 31.sp),
        child: Text(
          text,
          style: GoogleFonts.markoOne(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
