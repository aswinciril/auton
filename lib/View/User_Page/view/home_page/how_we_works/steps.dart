import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({
    super.key,
    required this.icon,
    required this.description,
  });
  final String icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 212, 214, 199)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Image.asset(
              icon,
              height: 50,
            ),
            SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                description,
                style: TextStyle(
                  color: Color.fromARGB(255, 48, 34, 34),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
