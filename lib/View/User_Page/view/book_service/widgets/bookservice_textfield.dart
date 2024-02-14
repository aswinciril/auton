import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.maxline,
    this.icon,
    super.key,
    this.serviceName,
    required this.isServiceField,
    this.controller,
  });
  final TextEditingController? controller;
  final IconData? icon;
  final String? serviceName;
  final int maxline;
  final bool isServiceField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ??
        TextEditingController(); // Fix: Create a new controller if none provided
    _textEditingController.text =
        widget.isServiceField ? widget.serviceName ?? "" : "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                maxLines: widget.maxline,
                controller: widget.controller,
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(
                  hintText: 'Enter your text',
                  suffixIcon: Icon(widget.icon),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
