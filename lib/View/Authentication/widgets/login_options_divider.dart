import 'package:flutter/material.dart';

class LoginOptionsDivider extends StatelessWidget {
  const LoginOptionsDivider({
    super.key,
    required this.dividertext,
  });
  final String dividertext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Colors.white,
              height: 10, // Change the height to adjust the length
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              dividertext,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              height: 10, // Change the height to adjust the length
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
