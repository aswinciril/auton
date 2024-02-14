import 'package:auton/View/Authentication/view/first_page.dart';
import 'package:auton/View/Splash/splash_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization or data loading logic here
    // You can use Future.delayed to simulate a delay for the splash screen
    Future.delayed(Duration(seconds: 7), () {
      // Navigate to the next screen (e.g., your main application screen)
      // FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //   if (user != null) {
      //     // User is signed in, navigate to the home page
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => DetailsPage(),
      //       ),
      //     );
      //   }
      // }); //TODO

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FirstPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/splash/splashicon.json',
                  height: 270, width: 280),
              SplashText(),
            ],
          ), // Replace with your animation file
        ),
      ),
    );
  }
}
