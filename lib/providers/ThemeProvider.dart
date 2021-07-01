import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //Todo:save current selected Theme in sharedPreferences

  ThemeMode themeMode = ThemeMode.dark;

  bool isDarkModeEnabled(){
    return themeMode==ThemeMode.dark;
  }

  void toggleTheme(){
    if(themeMode==ThemeMode.light)
      themeMode=ThemeMode.dark;
    else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}