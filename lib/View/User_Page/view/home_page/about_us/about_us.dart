import 'package:auton/View/User_Page/view/home_page/bottom_curve_clip/clipper.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Faded Image
        Container(
          child: ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              color: const Color.fromARGB(255, 210, 210, 196).withOpacity(0.8),
              // child: Image.asset(
              //   'assets/images/blurr.jpg',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ),

        // Clickable Text Overlap

        Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 19,
                ),
                child: Text(
                  'About Us',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 66, 5, 0),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.white, // Shadow color
                          offset:
                              Offset(2, 2), // Horizontal and vertical offset
                          blurRadius: 4, // Blur radius
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 19, right: 20, left: 20),
                child: Text(
                  "At AUTON, we're your trusted companion on the road to hassle-free car maintenance and service. With a commitment to making vehicle care easy and convenient, we bring the garage to your fingertips. Our user-friendly app allows you to schedule appointments, track service history, and access vital information about your vehicle. Whether it's routine maintenance, repairs, or emergency assistance, AUTON is your go-to solution for all things automotive. Join our community of satisfied users and experience the road ahead with confidence.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.ibarraRealNova(
                    textStyle: TextStyle(
                      height: 1.6,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(
                              255, 247, 247, 247), // Shadow color
                          offset:
                              Offset(2, 2), // Horizontal and vertical offset
                          blurRadius: 4, // Blur radius
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
