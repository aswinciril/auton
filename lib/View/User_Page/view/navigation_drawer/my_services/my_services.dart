import 'package:auton/View/User_Page/view/navigation_drawer/my_services/widgets/my_service_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    print('Current User UID: ${user?.uid}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Service History"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      // backgroundColor: Color.fromARGB(255, 1, 1, 28),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('requested_services')
              .where('userId', isEqualTo: user?.uid) // Filter by user ID
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(); // Loading indicator while data is being fetched
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                  child: Text('No services found for the current user.'));
            }

            var services = snapshot.data!.docs;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 250.sp,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.sp),
                          child: Image.asset(
                            'assets/service_history/myservices.jpg',
                            height:
                                160.sp, // Set the desired height for the image
                            width:
                                150.sp, // Set the desired width for the image
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                        ),
                        SizedBox(height: 11.sp),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 19),
                              child: Text(
                                " My ",
                                style: GoogleFonts.basic(
                                  textStyle: TextStyle(
                                    fontSize: 29.sp,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.sp,
                            ),
                            Text(
                              "Services",
                              style: GoogleFonts.basic(
                                textStyle: TextStyle(
                                  fontSize: 29.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ), // Add some spacing
                      ],
                    ),
                  ),
                  for (var service in services)
                    MyServiceList(
                      date: service['Service Date'],
                      serviceType: service['Service Type'],
                      carnum: service['Vehicle Number'],
                      location: service['Location'],
                      status: "p",
                    ),

                  SizedBox(
                    height: 25.sp,
                  ),
                  // MyServiceList(
                  //   date: "6/03/2023",
                  //   serviceType: "Oil Change",
                  //   carnum: "2500",
                  //   location: "Thrissur",
                  //   status: 'Done',
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // MyServiceList(
                  //   date: "20/01/2023",
                  //   serviceType: "Tire Service",
                  //   carnum: "6000",
                  //   location: "Edapally",
                  //   status: 'Done',
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // MyServiceList(
                  //   date: "13/12/2022",
                  //   serviceType: "Battery Service",
                  //   carnum: "1000",
                  //   location: "Thodupuzha",
                  //   status: 'Cancelled',
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // MyServiceList(
                  //   date: "1/12/2022",
                  //   serviceType: "Brake Service",
                  //   carnum: "3000",
                  //   location: "Kothamangalam",
                  //   status: 'Done',
                  // ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                ],
              ),
            );
          }),
    );
  }
}
