import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _fulnameController = TextEditingController();
  // String _userDetails() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final String? email = user?.email;
  //   return email!;
  // }

  @override
  Widget build(BuildContext context) {
    final nameValue = Provider.of<NameProvider>(context).fullName;
    _nameController.text = nameValue;
    final lnameValue = Provider.of<LastNameProvider>(context).lastName;
    _lnameController.text = lnameValue;

    _fulnameController.text = nameValue + " " + lnameValue;

    // final val = _userDetails();
    // _emailController = TextEditingController(text: val);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // Text fields for name, email, and message
          TextField(
            controller: _fulnameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Message',
              alignLabelWithHint: true,
            ),
            maxLines: 4,
          ),

          SizedBox(height: 16.0),
          AuthenticationButton(
            onpressed: () {},
            width: 260,
            title: "SUBMIT",
            onprimarycolor: Colors.white,
            primarycolor: const Color.fromARGB(255, 0, 11, 19),
          ),
        ],
      ),
    );
  }
}
