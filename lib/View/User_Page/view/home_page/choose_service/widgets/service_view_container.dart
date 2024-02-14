import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/User_Page/view/book_service/book_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({
    super.key,
    required this.appbarname,
    required this.imageUrl,
    required this.servicename,
    required this.servicedescription,
  });

  final String appbarname;
  final String imageUrl;
  final String servicename;
  final String servicedescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 200.sp,
                height: 200.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              servicename,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.besley(
                textStyle: TextStyle(
                  fontSize: 25.sp,
                  color: Color.fromARGB(255, 99, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28, right: 28, top: 10),
              child: Text(
                servicedescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromARGB(255, 57, 56, 54),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AuthenticationButton(
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookService(
                        serviceName: servicename,
                      ),
                    ));
              },
              width: 280,
              title: "SELECT",
              onprimarycolor: Colors.white,
              primarycolor: const Color.fromARGB(
                255,
                0,
                23,
                43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
