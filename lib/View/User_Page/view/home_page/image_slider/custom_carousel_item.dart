import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomCarouselItem extends StatelessWidget {
  CustomCarouselItem(
      {super.key, required this.imageUrl, required this.imageDescription});

  final String imageUrl;
  final String imageDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imageUrl),
        SizedBox(height: 9.sp),
        Text(
          imageDescription,
          style: GoogleFonts.balooChettan2(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 66, 5, 0),
            ),
          ),
        ),

        //bw image and text
      ],
    );
  }
}
