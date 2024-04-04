import 'package:auton/View/Authentication/view/OTP/number_login.dart';
import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Authentication/view/signup_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/Authentication/widgets/login_options_button.dart';
import 'package:auton/View/Authentication/widgets/login_options_divider.dart';
import 'package:auton/View/Authentication/widgets/login_textfield.dart';
import 'package:auton/View/User_Page/view/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      // Check if the user is not null and the email and password match
      if (authResult.user != null &&
          authResult.user!.email == usernameController.text) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DetailsPage(),
        ));
      } else {
        // Incorrect email or password, display an error message.
        // You can customize this part based on your app's UI/UX.
        print('Invalid email or password');
      }
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
                height: 67.sp,
              ),
              Text(
                "Welcome,",
                style: GoogleFonts.libreBaskerville(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 29,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Glad to see you!",
                style: GoogleFonts.libreBaskerville(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                  ),
                ),
              ),
              SizedBox(
                height: 27.sp,
              ),
              LoginTextField(
                controller: usernameController,
                hint: "enter Username",
                label: "Username",
                suffixicon: Icons.person,
                obscureText: false,
              ),
              SizedBox(
                height: 14.sp,
              ),
              LoginTextField(
                controller: passwordController,
                hint: "enter Password",
                label: "Password",
                suffixicon: Icons.security,
                obscureText: true,
              ),
              SizedBox(
                height: 11.sp,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 26.sp,
              ),
              AuthenticationButton(
                  onpressed: () {
                    signIn(context);
                  },
                  width: 280,
                  title: "LOGIN"),
              SizedBox(
                height: 37.sp,
              ),
              const LoginOptionsDivider(dividertext: "or login with"),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NumberLogin(),
                            ),
                          );
                        },
                        animation:
                            "assets/animations/login_animations/otp_animation.json",
                        width: 140)
                  ],
                ),
              ),
              SizedBox(
                height: 55.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                      },
                      child: Text(
                        "Sign Up Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
