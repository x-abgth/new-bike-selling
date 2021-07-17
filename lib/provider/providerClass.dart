import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  bool isPressed = false;

  void changeValue(val) {
    isPressed = val;
    notifyListeners();
  }
}
