import 'package:auton/View/User_Page/view/home_page/about_us/about_us.dart';
import 'package:auton/View/User_Page/view/home_page/bottom_curve_clip/bottom_curve_clip.dart';
import 'package:auton/View/User_Page/view/home_page/choose_service/choose_service.dart';
import 'package:auton/View/User_Page/view/home_page/contact_us/contact_us.dart';
import 'package:auton/View/User_Page/view/home_page/how_we_works/how_we_works.dart';
import 'package:auton/View/User_Page/view/home_page/how_we_works/steps.dart';
import 'package:auton/View/User_Page/view/home_page/image_slider/image_slider.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/drawer_header.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/navigation_drawer.dart';
import 'package:auton/View/customwidgets/animated_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 210, 196),
      appBar: AppBar(
        title: HomeTitle(),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 28, 50),
      ),
      drawer: const HomeNavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomCurveClip(), // const Color.fromARGB(255, 210, 210, 196),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  " Services We Offer",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 5, 0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7.sp,
            ),
            ServiceImageSlider(), //
            const SizedBox(
              height: 20,
            ),
            const ChooseService(),
            AboutUs(),
            const SizedBox(
              height: 40,
            ),
            const HowWeWorks(),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/choosecar.png",
                description: "Select Your Car"),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/scheduleservice.png",
                description: "Schedule Service"),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/chooseservice.png",
                description: "Choose Service"),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/servicebooking.png",
                description: "Book Service"),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/payment.png", description: "Payment"),
            const SizedBox(
              height: 10,
            ),
            const Steps(
                icon: "assets/stepss/confirm.png",
                description: "Confirm Booking "),
            const SizedBox(
              height: 20,
            ),
            const ContactUs(),
          ],
        ),
      ),
    );
  }
}
