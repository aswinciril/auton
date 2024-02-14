import 'dart:developer';

import 'package:auton/View/Authentication/view/OTP/number_login.dart';
import 'package:auton/View/Authentication/view/first_page.dart';
import 'package:auton/View/Authentication/view/login_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/Authentication/widgets/login_options_button.dart';
import 'package:auton/View/Authentication/widgets/login_options_divider.dart';
import 'package:auton/View/Authentication/widgets/login_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // final TextEditingController confirmpasswordController = TextEditingController();
  Future<void> _signUp(BuildContext context) async {
    //TODO Undo
    log("signing.....");
    try {
      final UserCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      if (UserCredential.user != null) {
        // Store user information in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(UserCredential.user!.uid)
            .set({
          'userId': _usernameController.text,
          // Add other user information if needed
        });

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      }
      //---------
      final user = FirebaseAuth.instance.currentUser;
      final email = user?.email;
      //-----
      // User successfully created, you can navigate to another screen.
    } catch (e) {
      // Handle errors here, e.g., display an error message.
      print('Error: $e');
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65.sp,
              ),
              Text(
                "Create Account,",
                style: GoogleFonts.libreBaskerville(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "to get started now!",
                style: GoogleFonts.libreBaskerville(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 23.sp,
              ),
              // LoginTextField(
              //   hint: "Enter Your Name",
              //   label: "Full Name",
              //   suffixicon: Icons.lock,
              //   obscureText: true,
              // ),
              // SizedBox(
              //   height: 12.sp,
              // ),
              LoginTextField(
                controller: _usernameController,
                hint: "enter Email Id",
                label: "Email Id",
                suffixicon: Icons.person,
                obscureText: false,
              ),
              SizedBox(
                height: 12.sp,
              ),
              LoginTextField(
                controller: _passwordController,
                hint: "enter Password",
                label: "Password",
                suffixicon: Icons.security,
                obscureText: true,
              ),
              SizedBox(
                height: 12.sp,
              ),
              LoginTextField(
                hint: "Re-enter Password",
                label: "Confirm Password",
                suffixicon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 35,
              ),
              AuthenticationButton(
                  onpressed: () {
                    log("username :${_usernameController.text.trim()}");
                    log("password :${_passwordController.text.trim()}");
                    _signUp(context);
                  },
                  width: 280,
                  title: "SIGN UP"),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );
                },
                child:
                    const LoginOptionsDivider(dividertext: "or sign up with"),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginOptionsButton(
                        onpressed: () {},
                        animation:
                            "assets/animations/login_animations/googlelogin.json",
                        width: 140),
                    LoginOptionsButton(
                        onpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NumberLogin(),
                          ));
                        },
                        animation:
                            "assets/animations/login_animations/otp_animation.json",
                        width: 140)
                  ],
                ),
              ),
              SizedBox(
                height: 50.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ],
              ),
              SizedBox(
                height: 3.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
