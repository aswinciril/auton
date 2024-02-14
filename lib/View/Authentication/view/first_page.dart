import 'package:auton/View/Authentication/view/OTP/number_login.dart';
import 'package:auton/View/Authentication/view/login_page.dart';
import 'package:auton/View/Authentication/view/OTP/otp_login.dart';
import 'package:auton/View/Authentication/view/signup_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/Splash/splash_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 239, 191, 246),
              Color.fromARGB(255, 115, 144, 224)
            ], // Define your gradient colors here.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110.sp,
            ),
            Image.asset(
              "assets/authentication_icons/icon.png",
              height: 80.sp,
              width: 80.sp,
            ),
            SizedBox(
              height: 28.sp,
            ),
            const AppTitle(color: Colors.white),
            SizedBox(height: 6.sp),
            Text(
              "All we know is to FIX",
              style: GoogleFonts.risque(
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: 36.sp),
            AuthenticationButton(
              onpressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              title: "LOGIN",
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthenticationButton(
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ));
              },
              title: "SIGN UP",
              width: 250,
            ),
            SizedBox(
              height: 100.sp,
            ),
          ],
        ),
      ),
    );
  }
}
