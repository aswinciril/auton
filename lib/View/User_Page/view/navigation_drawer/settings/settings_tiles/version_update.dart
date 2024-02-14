import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container to give 3/4 height to the image
          Container(
            height: MediaQuery.of(context).size.height * .54.sp,
            child: Image.asset("assets/update/update.jpeg", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
