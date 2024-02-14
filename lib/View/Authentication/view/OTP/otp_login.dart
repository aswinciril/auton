import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sizer/sizer.dart';

class OtpLogin extends StatefulWidget {
  final String verificationId;
  OtpLogin({super.key, required this.verificationId});

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  TextEditingController pinController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<void> _signInWithOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text,
      );

      // Sign in with the provided credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Retrieve the signed-in user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if the user is not null
      if (user != null) {
        // Get the user's phone number
        String phoneNumber = user.phoneNumber ?? '';

        // Update the "users" collection with the phone number
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'userId': phoneNumber,
        });

        // Navigate to the DetailsPage if needed
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DetailsPage()));
      } else {
        // Handle the case where the user is null
        print("Error: User is null after signing in with OTP");
      }
    } catch (e) {
      // Handle sign-in failure
      print("Error: $e");
    }
  }

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
              height: 15.sp,
            ),
            Image.asset(
              "assets/authentication_icons/otplogin.png",
              height: 100,
              width: 100,
            ),

            SizedBox(
              height: 12.sp,
            ),

            Text(
              "Confirm OTP",
              style: GoogleFonts.cookie(
                textStyle: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            Text(
              "Enter the otp sent to  XXXXXX7896",
              style: GoogleFonts.basic(
                textStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            // PIN Code Input
            PinCodeTextField(
              controller: otpController,
              maxLength: 6,
              pinBoxHeight: 50,
              pinBoxWidth: 50,
              autofocus: false,
              highlight: true,
              highlightColor: const Color.fromARGB(255, 67, 161, 237),
              defaultBorderColor: Colors.white,
              hasTextBorderColor: Colors.green,
              onTextChanged: (String value) {
                // You can handle changes in the PIN code input here
              },
            ),
            SizedBox(height: 23.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive code? ",
                  style: GoogleFonts.basic(
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Text(
                  "Resend OTP ",
                  style: GoogleFonts.basic(
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 179, 221, 255)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 19.sp,
            ),
            AuthenticationButton(
              onpressed: _signInWithOTP,
              width: 112.sp,
              title: "Verify",
              primarycolor: Color.fromARGB(255, 81, 216, 85),
              onprimarycolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
