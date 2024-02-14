import 'package:auton/View/User_Page/view/navigation_drawer/settings/settings_tiles/version_update.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Notification Preferences'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to notification settings page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Password Change'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account settings page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AccountSettingsPage()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Location Services'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy settings page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PrivacySettingsPage()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy settings page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PrivacySettingsPage()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text('About Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the "About Us" page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AboutUsPage()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text('App Version and Updates'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
