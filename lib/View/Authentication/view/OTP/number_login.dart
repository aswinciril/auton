import 'package:auton/View/Authentication/view/OTP/otp_login.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/User_Page/view/book_service/widgets/bookservice_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NumberLogin extends StatefulWidget {
  const NumberLogin({super.key});

  @override
  State<NumberLogin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NumberLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController phoneNumberController =
      TextEditingController(text: "+91");
  TextEditingController otpController = TextEditingController();

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle successful verification
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed
        print("Error: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID to use later
        // Typically, you can use a state variable to store the verification ID
        // and then navigate to the OTP verification screen
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpLogin(verificationId: verificationId),
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout, if needed
      },
    );
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
              "assets/authentication_icons/smartphone.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 12.sp,
            ),
            Text(
              "Login",
              style: GoogleFonts.allura(
                textStyle: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            Text(
              "Enter your mobile number",
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
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 22.sp,
            ),
            AuthenticationButton(
              onpressed: _verifyPhoneNumber,
              width: 112.sp,
              title: "Get Otp",
              primarycolor: Color.fromARGB(255, 81, 216, 85),
              onprimarycolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
