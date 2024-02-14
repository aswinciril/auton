import 'package:auton/View/User_Page/view/home_page/contact_us/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.sp,
      width: double.infinity,
      color: const Color.fromARGB(255, 1, 28, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              " Contact Us",
              style: GoogleFonts.basic(
                textStyle: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ClickableIcons(
            icon: Icons.location_city_outlined,
            text: "Kochi,Kerala",
            ontap: () {
              launchUrlString(
                  "https://www.google.com/maps/place/Zartek+Technologies+Private+Limited/@10.0541759,76.3509426,16.96z/data=!4m20!1m13!4m12!1m4!2m2!1d76.35214!2d10.0526936!4e1!1m6!1m2!1s0x3b080c04e5207eb7:0x3cce030c43faf4b3!2szartek+maps+google!2m2!1d76.354354!2d10.055792!3m5!1s0x3b080c04e5207eb7:0x3cce030c43faf4b3!8m2!3d10.055792!4d76.354354!16s%2Fg%2F11g8bx4zw9?entry=ttu");
            },
          ),
          SizedBox(
            height: 10,
          ),
          ClickableIcons(
            icon: Icons.call,
            text: "6238946566",
            ontap: () {
              launchUrlString("tel:6238946566");
            },
          ),
          SizedBox(
            height: 10,
          ),
          ClickableIcons(
            icon: Icons.email,
            text: "auton123@gmail.com",
            ontap: () {
              launchUrlString(
                  "mailto:auton123@gmail.com?subject=Auton Service&body=Hello Auton,");
            },
          ),
          SizedBox(
            height: 33,
          ),
          SocialMediaIconsRow(),
        ],
      ),
    );
  }
}

class ClickableIcons extends StatelessWidget {
  const ClickableIcons(
      {super.key, required this.icon, required this.text, required this.ontap});
  final IconData icon;
  final String text;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(
            icon,
            size: 17.sp,
            color: Color.fromARGB(255, 141, 219, 233),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: GoogleFonts.notoSansMro(
              textStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
