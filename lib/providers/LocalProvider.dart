import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier{
  var locale = 'ar';
  void changeLocale(String langCode){
    locale=langCode;
    notifyListeners();
  }
}