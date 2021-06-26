import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  var themMode = ThemeMode.dark;

  void toggleTheme(){
    if(themMode==ThemeMode.light)
      themMode = ThemeMode.dark;
    else {
      themMode=ThemeMode.light;
    }
    notifyListeners();
  }
  bool isDarkModeEnabled(){
    return themMode == ThemeMode.dark;
  }
}
class MyColors{
  static var primaryColor = Color.fromARGB(255, 93, 156, 236);
  static var backGroundColor = Color.fromARGB(255, 223, 236, 219);
  static var accentColor = Colors.deepOrange;
  static var darkBgColor = Color.fromARGB(255, 6, 14, 30);

}
class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyColors.primaryColor,
    accentColor: MyColors.accentColor,
    scaffoldBackgroundColor: MyColors.backGroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: MyColors.primaryColor
    )
  );
  static final darkTheme = ThemeData(
      primaryColor: MyColors.primaryColor,
      accentColor: MyColors.accentColor,
      scaffoldBackgroundColor: MyColors.darkBgColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyColors.primaryColor
      )
  );
}