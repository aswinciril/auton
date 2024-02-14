import 'package:auton/View/Authentication/widgets/auth_button.dart';

import 'package:auton/View/User_Page/view/home_page/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 239, 191, 246),
                Color.fromARGB(255, 115, 144, 224)
              ], // Define your gradient colors here.
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.sp,
                ),
                Text(
                  "What should we \n call you?",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Text(
                  "Enter your details",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 3.sp,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  onChanged: (value) {
                    // Access the provider and set the value
                    Provider.of<NameProvider>(context, listen: false)
                        .setFullName(value);
                  },
                ),
                SizedBox(
                  height: 7.sp,
                ),
                TextField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  onChanged: (value) {
                    // Access the provider and set the value
                    Provider.of<LastNameProvider>(context, listen: false)
                        .setLastName(value);
                  },
                ),
                SizedBox(
                  height: 7.sp,
                ),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact',
                  ),
                  onChanged: (value) {
                    // Access the provider and set the value
                    Provider.of<ContactProvider>(context, listen: false)
                        .setContact(value);
                  },
                ),
                SizedBox(
                  height: 59.sp,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: AuthenticationButton(
                      title: "Continue",
                      onpressed: () async {
                        //TODO undo
                        //accessing name
                        String fullName =
                            Provider.of<NameProvider>(context, listen: false)
                                .fullName;
                        String lastName = Provider.of<LastNameProvider>(context,
                                listen: false)
                            .lastName;
                        String contactNumber =
                            Provider.of<ContactProvider>(context, listen: false)
                                .contactNumber;

                        String uid =
                            FirebaseAuth.instance.currentUser?.uid ?? '';

                        // Fetch the existing user document from the "users" collection
                        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .get();

                        // Check if the user document exists
                        if (userSnapshot.exists) {
                          // Update the existing user document with additional fields
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .update({
                            'fullName': fullName,
                            'lastName': lastName,
                            'contactNumber': contactNumber,
                            // Add other user information if needed
                          });
                        } else {
                          // Handle the case where the user document doesn't exist
                          // This might occur if the user was created without additional information
                          print(
                              'User document not found in "users" collection.');
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                      },
                      width: 200.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameProvider extends ChangeNotifier {
  String _fullName = '';

  String get fullName => _fullName;

  void setFullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }
}

class LastNameProvider extends ChangeNotifier {
  String _lastName = '';
  String get lastName => _lastName;

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }
}

class ContactProvider extends ChangeNotifier {
  String _contactNumber = '';

  String get contactNumber => _contactNumber;

  void setContact(String contactNumber) {
    _contactNumber = contactNumber;
    notifyListeners();
  }
}
