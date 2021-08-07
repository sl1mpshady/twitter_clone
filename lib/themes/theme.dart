import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darkMode = false;

  void setDarkMode(bool mode) {
    _darkMode = mode;
    notifyListeners();
  }

  bool get darkMode => _darkMode;
}
