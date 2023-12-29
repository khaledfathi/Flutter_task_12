import 'package:flutter/material.dart';

class LoginScreenPasswordState extends ChangeNotifier {
  bool passwordHide = true;
  IconData passwordVisibilityIcon = Icons.visibility;

  void passwordVisibilityToggle() {
    passwordHide  = !passwordHide; 
    passwordVisibilityIcon = passwordVisibilityIcon == Icons.visibility
        ? Icons.visibility_off
        : Icons.visibility;
    notifyListeners();
  }
}
