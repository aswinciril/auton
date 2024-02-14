import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Splash/splash_screen.dart';
import 'package:auton/View/User_Page/view/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io' show Platform;
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: (Platform.isIOS)
        ? const FirebaseOptions(
            apiKey: "AIzaSyAWNhn9hup7S5DEq28G_ACX7rYuLW7s9-c",
            appId: "1:702457332416:ios:7c61b1d0e4eb4bd51da325",
            messagingSenderId: "702457332416",
            projectId: "auton-ecc25",
            storageBucket: "gs://auton-ecc25.appspot.com")
        : const FirebaseOptions(
            apiKey: "AIzaSyAWNhn9hup7S5DEq28G_ACX7rYuLW7s9-c",
            appId: "1:702457332416:android:a1c1d3160d7d65501da325",
            messagingSenderId: "702457332416",
            projectId: "auton-ecc25",
          ),
  );

  await Hive.initFlutter();
  await Hive.openBox<String>('image_paths');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NameProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LastNameProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ContactProvider(),
      ),
    ],
    child: Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        // darkTheme: ThemeData.dark(), // Define a dark theme ̰
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(),
    );
  }
}
