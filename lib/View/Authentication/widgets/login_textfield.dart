import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    this.suffixicon,
    required this.obscureText,
  });
  TextEditingController? controller;
  final String label;
  final String hint;
  final IconData? suffixicon;
  final bool obscureText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(widget.suffixicon)),
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 21, color: Colors.white),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              fontSize: 17, color: Color.fromARGB(255, 255, 255, 255)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
