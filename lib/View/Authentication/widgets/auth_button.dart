import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    required this.onpressed,
    this.title,
    this.primarycolor,
    this.onprimarycolor,
    required this.width,
  });

  final Function() onpressed;
  final String? title;
  final double width;
  final Color? primarycolor;
  final Color? onprimarycolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        primary: primarycolor,
        onPrimary: onprimarycolor,
        minimumSize: Size(width, 60),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
