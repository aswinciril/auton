import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaIconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaIcon(
          ontap: () {
            launchUrlString(
                "whatsapp://send?phone=916238946566&text=Hello Auton,");
          },
          icon: FontAwesomeIcons.whatsapp,
          color: Color(0xFF25D366), // WhatsApp green color
        ),
        SizedBox(width: 14.sp),
        SocialMediaIcon(
          ontap: () {
            launchUrlString("https://www.instagram.com/auton_car_service__/");
          },
          icon: FontAwesomeIcons.instagram,
          color: Color(0xFFC13584), // Instagram pink color
        ),
        SizedBox(width: 14.sp),
        SocialMediaIcon(
          ontap: () {
            launchUrlString(
                "https://www.linkedin.com/company/bosch-car-service-india/");
          },
          icon: FontAwesomeIcons.linkedin,
          color: Color(0xFF1DA1F2), // Twitter blue color
        ),
      ],
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function() ontap;

  SocialMediaIcon(
      {required this.icon, required this.color, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        icon,
        size: 21.sp,
        color: color,
      ),
    );
  }
}
