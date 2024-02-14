import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChooseDetails extends StatefulWidget {
  const ChooseDetails({
    required this.text,
    required this.hint,
    required this.width,
    required this.icon,
    super.key,
    required this.ontap,
    required this.controller,
  });
  final TextEditingController controller;
  final Function() ontap;
  final String text;
  final String hint;
  final IconData icon;
  final double width;

  @override
  State<ChooseDetails> createState() => _ChooseDetailsState();
}

class _ChooseDetailsState extends State<ChooseDetails> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: widget.width,
        child: TextField(
          controller: widget.controller,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.white12),
            suffixIcon:
                GestureDetector(onTap: widget.ontap, child: Icon(widget.icon)),
            suffixIconColor: Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3.sp,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 75, 88, 133),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
      ),
    );
  }
}
