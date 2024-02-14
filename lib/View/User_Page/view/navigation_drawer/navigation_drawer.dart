import 'package:auton/View/User_Page/view/navigation_drawer/drawer_header.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/help_and_support/help_and_support.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/logout/user_logout.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/my_services/my_services.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/rating/rating_app.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/settings/settings.dart';
import 'package:auton/View/User_Page/view/navigation_drawer/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeNavigationDrawer extends StatelessWidget {
  const HomeNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 230.sp,

            //drawerheader for USER
            child: NavigationDrawerHeader(), //drawerheader for USER
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserProfileScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              "My Services",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyServicesPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text(
              "Help and Support",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HelpAndSupport(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return UserLogout();
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text(
              "Rate Us",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StarRatingDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
