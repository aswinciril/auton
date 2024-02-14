import 'dart:developer';

import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auton/View/User_Page/view/home_page/bottom_curve_clip/clipper.dart';
import 'package:auton/View/User_Page/view/home_page/bottom_curve_clip/widgets/choose_details_textfield.dart';
import 'package:auton/View/customwidgets/done_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomCurveClip extends StatefulWidget {
  const BottomCurveClip({
    super.key,
  });

  @override
  State<BottomCurveClip> createState() => _BottomCurveClipState();
}

class _BottomCurveClipState extends State<BottomCurveClip> {
  //firebase
  Future<void> _serviceDetailsStore(String userId) async {
    log("done called-> ${_nameController.text}");
    try {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the user's document
      DocumentReference userRef = firestore.collection('users').doc(userId);

      // Create a new document in the 'service_details' subcollection
      await userRef.collection('service_details').add({
        'carName': _nameController.text,
        'carNumber': _numplateController.text,
        'city': _cityController.text,
        'date': _dateController.text,
        'location': _locationController.text,
        'timestampField': FieldValue.serverTimestamp(),
      });

      servicedetailsToast(context);

      // Optionally, you can print a message or show a dialog to indicate success
      print('Data saved to Firestore successfully');
    } catch (e) {
      // Handle any errors
      print('Error saving data to Firestore: $e');
    }
  }

  TextEditingController _dateController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numplateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameValue = Provider.of<NameProvider>(context).fullName;

    return SizedBox(
      height: 469.sp,
      width: double.infinity,
      child: ClipPath(
        clipper: BottomCurveClipper(),
        child: Container(
          color: const Color.fromARGB(
              255, 1, 28, 50), // Set your desired container color
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Hello $nameValue,",
                      style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.sp,
                ),

                //please choose your car
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Please choose your car and select",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 243, 211, 211)),
                    ),
                  ),
                ),
                SizedBox(height: 4.sp),

                //location and date of visit
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "location and date of visit",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 243, 211, 211)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.sp,
                ),

                //choose ur car textfield
                ChooseDetails(
                    controller: _nameController,
                    ontap: () {},
                    text: "Car Name",
                    hint: "Choose your car",
                    width: MediaQuery.of(context).size.width * 0.82,
                    icon: Icons.local_taxi),

                SizedBox(
                  height: 13.sp,
                ),

                ChooseDetails(
                    controller: _numplateController,
                    ontap: () {},
                    text: "Vehicle Number",
                    hint: "Eg:KL07J7897",
                    width: MediaQuery.of(context).size.width * 0.82,
                    icon: Icons.no_crash_rounded),

                SizedBox(
                  height: 13.sp,
                ),

                // choose location and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChooseDetails(
                        controller: _cityController,
                        ontap: () {
                          _getCurrentLocation(context);
                        },
                        text: "City",
                        hint: "Choose City",
                        width: MediaQuery.of(context).size.width * 0.48,
                        icon: Icons.location_on),
                    SizedBox(
                      width: 7.sp,
                    ),
                    ChooseDetails(
                        controller: _dateController,
                        ontap: () {
                          _selectDate(context);
                        },
                        text: "Date",
                        hint: "Pick Date",
                        width: MediaQuery.of(context).size.width * 0.32,
                        icon: Icons.calendar_month),
                  ],
                ),
                SizedBox(
                  height: 13.sp,
                ),

                ChooseDetails(
                    controller: _locationController,
                    ontap: () {},
                    text: "Pickup Location",
                    hint: "Enter Pickup Location",
                    width: MediaQuery.of(context).size.width * 0.82,
                    icon: Icons.home_filled),

                SizedBox(
                  height: 19.sp,
                ),

                //DONE BUTTON CAR SELECTED
                DoneButton(
                  text: "SUBMIT",
                  onTap: () async {
                    log("step 1");

                    // Get the current user from Firebase Authentication
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      String userId = user.uid;

                      await _serviceDetailsStore(
                          userId); // Save data to Firestore
                    } else {
                      // Handle the case where the user is not authenticated
                      print("User is not authenticated.");
                    }
                  },
                ),

                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//date function
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // Format the picked DateTime to display only the date
      String formattedDate = DateFormat(' dd/MM    EEEE   yyyy').format(picked);

      // Set the formatted date to the controller
      _dateController.text = formattedDate;

      _dateController.selection = TextSelection.fromPosition(
        TextPosition(offset: 7),
      );

      // Call your ontap function if needed
      // widget.ontap();
    }
  }

  //location function
  Future<void> _getCurrentLocation(BuildContext context) async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle denied permission
        print('Location permission denied');
        return;
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocoding to get place name
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract the first placemark (most accurate result)
      Placemark firstPlacemark = placemarks.first;

      // Set the location and place name in the _locationController
      String locationText = ' ${firstPlacemark.locality}';
      _cityController.text = locationText;

      // Display the location in a dialog (you can customize this part)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Current Location'),
              content: Text(locationText),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ]);
        },
      );
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}

void servicedetailsToast(
  BuildContext context,
) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(
        "Details succesfully submitted, Now choose your Service",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 2.0,
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: 3),
      backgroundColor: Color.fromARGB(255, 215, 255, 239),
    ),
  );
}
