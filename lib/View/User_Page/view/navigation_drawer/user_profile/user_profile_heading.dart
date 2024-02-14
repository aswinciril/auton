import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserProfileHeading extends StatelessWidget {
  const UserProfileHeading({
    super.key,
    required this.text,
    required this.rightpadding,
  });
  final String text;
  final double rightpadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightpadding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 66, 5, 0),
        ),
      ),
    );
  }
}
