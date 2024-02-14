import 'dart:io';
import 'package:auton/View/User_Page/view/navigation_drawer/user_profile/user_profile_heading.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:auton/View/Authentication/view/details_page.dart';
import 'package:auton/View/Authentication/widgets/auth_button.dart';
import 'package:auton/View/User_Page/view/book_service/widgets/bookservice_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  String _profileImagePath = '';
  String _coverImagePath = '';

//picking profile pic from gallery

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Save the selected image file path to _profileImagePath
      setState(() {
        _profileImagePath = pickedFile.path; // Update the class-level variable
      });
    }
  }

  //picking cover pic from gallery

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Save the selected image file path to _profileImagePath
      setState(() {
        _coverImagePath = pickedFile.path; // Update the class-level variable
      });
    }
  }

//////////////////////////////////////////

  // String _userDetails() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final String? email = user?.email;
  //   return email!;
  // }

  @override
  Widget build(BuildContext context) {
    final nameValue = Provider.of<NameProvider>(context).fullName;
    final numValue = Provider.of<ContactProvider>(context).contactNumber;
    _numberController.text = numValue;

    // final val = _userDetails();
    // _emailController = TextEditingController(text: val);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background cover photo
            Stack(children: [
              Container(
                height: 180.sp,
                //color: Colors.amber,
                // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: _coverImagePath.isNotEmpty
                        ? FileImage(File(_coverImagePath))
                            as ImageProvider<Object>
                        : const AssetImage(
                            'assets/userprofile/profilecover.jpg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.sp,
                right: 8.sp,
                child: GestureDetector(
                  onTap: () {
                    _pickCoverImage();
                  }, // Define the function to handle editing the cover image
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.sp, top: 37.sp),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 21.sp,
                    )),
              ),
            ]),

            // User profile content
            Center(
              child: Column(
                children: [
                  SizedBox(height: 96.sp),
                  // To push content below the cover photo
                  // User avatar
                  AvatarGlow(
                    glowColor: const Color.fromARGB(255, 231, 241, 250),
                    startDelay: const Duration(milliseconds: 1000),
                    // glowColor: Colors.white,
                    glowShape:
                        BoxShape.circle, // customize the glow color as needed
                    child: CircleAvatar(
                      radius: 55.sp,
                      backgroundImage: _profileImagePath.isNotEmpty
                          ? FileImage(File(_profileImagePath))
                              as ImageProvider<Object>
                          : const AssetImage('assets/userprofile/dp.jpg'),
                    ),
                  ),

                  SizedBox(height: 8.sp),
                  Text(
                    nameValue,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: Text(
                      'change profile photo',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Color.fromARGB(255, 5, 113, 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.sp),

                  UserProfileHeading(
                    text: "About My CAR",
                    rightpadding: 180,
                  ),

                  SizedBox(
                    height: 8.sp,
                  ),

                  CustomTextField(
                    maxline: 3,
                    isServiceField: false,
                  ),

                  SizedBox(
                    height: 12.sp,
                  ),

                  UserProfileHeading(
                    text: "Phone No",
                    rightpadding: 225,
                  ),

                  SizedBox(
                    height: 8.sp,
                  ),

                  CustomTextField(
                    maxline: 1,
                    isServiceField: true,
                    controller: _numberController,
                    serviceName: _numberController.text,
                  ),

                  SizedBox(
                    height: 12.sp,
                  ),

                  UserProfileHeading(
                    text: "Email Id",
                    rightpadding: 242,
                  ),

                  SizedBox(
                    height: 8.sp,
                  ),

                  CustomTextField(
                    maxline: 1,
                    isServiceField: true,
                    serviceName: _emailController.text, //TODO
                  ),

                  SizedBox(
                    height: 16.sp,
                  ),

                  AuthenticationButton(
                      onpressed: () {},
                      primarycolor: const Color.fromARGB(255, 1, 15, 27),
                      onprimarycolor: Colors.white,
                      title: "UPDATE",
                      width: 260)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
