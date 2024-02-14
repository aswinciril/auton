import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/User_Page/view/home_page/contact_us/widgets/social_media_icons.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/help_and_support/contact_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HelpAndSupport extends StatefulWidget {
  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Help and Support'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              " FAQ's",
              style: GoogleFonts.bitter(
                textStyle: TextStyle(
                  fontSize: 39,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 5, 0),
                ),
              ),
            ),
          ),
          // List of Frequently Asked Questions
          FAQItem(
            question: 'How do I schedule a car service appointment?',
            answer:
                'You can schedule a car service appointment through our app by selecting the needed service from "Choose your Service" option and choosing a date and time that suits you. You can also call our customer service hotline for assistance.',
          ),
          FAQItem(
            question: 'What types of car services do you offer?',
            answer:
                'We offer a wide range of services, including routine maintenance (oil change, tire service), repairs (brakes, engine), car wash, and more. You can view our full list of services in the app.',
          ),
          FAQItem(
            question: 'What are your service center hours?',
            answer:
                'Our service centers are typically open from 9 AM to 8 PM on weekdays and 9 AM to 10 PM on weekends. However, specific hours may vary by location.',
          ),

          FAQItem(
            question: 'Do you provide pick-up and drop-off services?',
            answer:
                'Yes, we offer pick-up and drop-off services for your convenience. You can request this service during the appointment scheduling process.',
          ),

          FAQItem(
            question: 'How do I cancel or reschedule my appointment?',
            answer:
                'To cancel or reschedule your appointment, go to the "My Services" section in the app and select the appointment you want to change. ',
          ),
          SizedBox(
            height: 20,
          ),
          // Add more FAQItem widgets for additional questions

          // Contact Form
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              " Have any queries?  Ask Us",
              style: GoogleFonts.bitter(
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 5, 0),
                ),
              ),
            ),
          ),
          ContactForm(),
          SizedBox(height: 7.sp),
          SocialMediaIconsRow(),
          SizedBox(height: 14.sp),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
