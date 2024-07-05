import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme() {
    themeMode == ThemeMode.light
        ? themeMode = ThemeMode.dark
        : themeMode = ThemeMode.light;
    notifyListeners();
  }
}
