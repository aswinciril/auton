import 'package:flutter/material.dart';

class ProfileImagePathProvider extends ChangeNotifier {
  String _profileImagePath = '';

  String get profileImagePath => _profileImagePath;

  void setProfileImagePath(String imagePath) {
    _profileImagePath = imagePath;
    notifyListeners();
  }
}
