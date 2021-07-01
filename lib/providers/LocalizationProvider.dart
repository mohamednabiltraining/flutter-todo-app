import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier{

  //Todo:save current selected Locale in sharedPreferences
  String locale = 'en';

  void changeLocale(String newLocale){
    if(newLocale==locale)
      return;
    locale = newLocale;
    notifyListeners();
  }
}