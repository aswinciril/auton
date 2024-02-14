import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/User_Page/view/book_service/widgets/bookservice_headings.dart';
import 'package:auton/View/User_Page/view/book_service/widgets/bookservice_textfield.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/my_services/my_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BookService extends StatefulWidget {
  BookService({
    super.key,
    required this.serviceName,
  });

  final String serviceName;

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _carnameController = TextEditingController();
  TextEditingController _numplateController = TextEditingController();
  TextEditingController _servicetypeController = TextEditingController();
  TextEditingController _servicedateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  //method to fetch data from firebase  wG7mo66YVp42pwNFNwSs
  Future<Map<String, dynamic>> fetchDataFromFirestore(String userId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference the user's document in the 'users' collection
      DocumentReference userDocument =
          firestore.collection('users').doc(userId);

      // Query the 'service_details' subcollection of the user
      QuerySnapshot querySnapshot = await userDocument
          .collection('service_details')
          .orderBy('timestampField', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot snapshot = querySnapshot.docs.first;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        print('Data fetched successfully: $data');
        return data;
      } else {
        print('No documents available.');
        return {};
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return {};
    }
  }

  //saving the "requested_services" collection to the firebase

  Future<void> saveDataToFirebase() async {
    try {
      // Get the current user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Include the user's UID in the data
        Map<String, dynamic> data = {
          'Customer Name': _nameController.text,
          'Contact Number': _numberController.text,
          'Car Name': _carnameController.text,
          'Vehicle Number': _numplateController.text,
          'Service Type': _servicetypeController.text,
          'Service Date': _servicedateController.text,
          'Location': _locationController.text,
          'userId': user.uid, // Include the user's UID
        };

        // Reference to the Firebase collection
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection('requested_services');

        // Add the data to the collection
        await collectionReference.add(data);

        print('Data added to Firebase');
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error adding data to Firebase: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // If the user is authenticated, get the user ID
      String userId = user.uid;

      // Fetch data using the user ID
      fetchDataFromFirestore(userId).then((data) {
        print("Fetched Data: $data");
        setState(() {
          _carnameController.text = data['carName'] ?? '';
          _numplateController.text = data['carNumber'] ?? '';
          _servicedateController.text = data['date'] ?? '';
          _locationController.text += '${data['location']}, ${data['city']}';
        });
      });
    } else {
      // Handle the case where the user is not authenticated
      print("User is not authenticated.");
    }

    _servicetypeController.text = widget.serviceName;
  }

  @override
  Widget build(BuildContext context) {
    final nameValue = Provider.of<NameProvider>(context).fullName;
    final lnameValue = Provider.of<LastNameProvider>(context).lastName;
    _nameController.text = nameValue + " " + lnameValue;
    _servicetypeController.text = widget.serviceName;
    final numValue = Provider.of<ContactProvider>(context).contactNumber;
    _numberController.text = numValue;

    // final carnameValue = _carnameController.text;
    // final dateValue = _servicedateController.text;
    // final locationValue = _locationController.text;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.sp,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Text(
                "Service Details",
                style: GoogleFonts.markoOne(
                  textStyle: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 116, 119),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 21.sp,
            ),
            BookServiceHeadings(
              text: "Name",
            ),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.abc,
              controller: _nameController,
              isServiceField: true,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(
              text: "Contact",
            ),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.abc,
              controller: _numberController,
              isServiceField: true,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(text: "Your Car"),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.local_taxi_outlined,
              isServiceField: true,
              controller: _carnameController,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(text: "Vehicle Number"),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.no_crash_rounded,
              isServiceField: true,
              controller: _numplateController,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(text: "Service Type"),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.car_repair_outlined,
              isServiceField: true,
              controller: _servicetypeController,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(text: "Service Date"),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.date_range,
              isServiceField: true,
              controller: _servicedateController,
            ),
            SizedBox(
              height: 15.sp,
            ),
            BookServiceHeadings(
              text: "Location",
            ),
            SizedBox(
              height: 8.sp,
            ),
            CustomTextField(
              maxline: 1,
              icon: Icons.location_pin,
              isServiceField: true,
              controller: _locationController,
            ),
            SizedBox(
              height: 24.sp,
            ),
            AuthenticationButton(
              onpressed: () {
                saveDataToFirebase();
                requestedServicesToast(context);
                Future.delayed(Duration(seconds: 3), () {
                  // Navigate to MyServicesPage after 4 seconds
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyServicesPage()),
                  );
                });
              },
              width: 260,
              title: "Request Service",
              primarycolor: const Color.fromARGB(255, 1, 17, 30),
              onprimarycolor: Colors.white,
            ),
            SizedBox(
              height: 27.sp,
            ),
          ],
        ),
      ),
    );
  }

  void requestedServicesToast(
    BuildContext context,
  ) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          "Your service request has been submitted succesfully",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2.0,
        behavior: SnackBarBehavior.fixed,
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 215, 255, 239),
      ),
    );
  }
}
