import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

class NavigationDrawerHeader extends StatefulWidget {
  const NavigationDrawerHeader({
    super.key,
  });

  @override
  State<NavigationDrawerHeader> createState() => _NavigationDrawerHeaderState();
}

class _NavigationDrawerHeaderState extends State<NavigationDrawerHeader> {
  TextEditingController _emailController = TextEditingController();

  String _userDetails() {
    final user = FirebaseAuth.instance.currentUser;
    final String? email = user?.email;
    return email!;
  }

  @override
  Widget build(BuildContext context) {
    final nameValue = Provider.of<NameProvider>(context).fullName;
    final lnamevalue = Provider.of<LastNameProvider>(context).lastName;
    // final val = _userDetails();
    // _emailController = TextEditingController(text: val);
    return UserAccountsDrawerHeader(
      accountName: Text(
        "   " + nameValue + " " + lnamevalue,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
      ),
      // accountEmail: Text("cirilaswin16@gmail.com"),
      currentAccountPictureSize: Size.square(40.w),
      currentAccountPicture: CircleAvatar(
        //TODO Give image saved in profile
        backgroundImage: AssetImage("assets/userprofile/dp.jpg"),
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 1, 28, 50),
      ),
    );
  }
}
