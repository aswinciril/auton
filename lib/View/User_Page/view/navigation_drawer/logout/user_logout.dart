import 'package:auton/View/Authentication/view/login_page.dart';
import 'package:flutter/material.dart';

class UserLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout Confirmation'),
      content: Text('Are you sure you want to Logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()),
            ); // Close the dialog
            // Call the logout function
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}
