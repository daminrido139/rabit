import 'package:flutter/material.dart';
import 'package:rabit/theme/dark_mode.dart';
import 'package:rabit/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themedata => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themedata(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themedata = darkMode;
    } else {
      themedata = lightMode;
    }
  }
}
