import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentMode = ThemeMode.system;

  changeThemeMode({required ThemeMode mode}) {
    currentMode = mode;
    notifyListeners();
  }
}