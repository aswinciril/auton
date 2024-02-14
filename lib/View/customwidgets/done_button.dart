import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key, required this.onTap, required this.text});

  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 195, 249, 195),
        onPrimary: const Color.fromARGB(255, 1, 21, 37),
        minimumSize: Size(160, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
