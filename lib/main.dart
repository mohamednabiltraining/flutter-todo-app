import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/LocalizationProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/EditTask/EditTask.dart';
import 'package:todo_app_mon/ui/home/HomeScreen.dart';
import 'package:todo_app_mon/ui/home/database/MyDataBase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  initDataBase();
  runApp(MyApp());
}

class MyThemeData {
  static final primaryColor = Color.fromRGBO(93, 156, 236, 1.0);
  static final colorBlack = Color.fromRGBO(54, 54, 54, 1.0);
  static final colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static final colorAccent = Color.fromRGBO(223, 236, 219, 1.0);
  static final lightTheme = ThemeData(
      primaryColor: MyThemeData.primaryColor,
      accentColor: MyThemeData.colorAccent,
      scaffoldBackgroundColor: MyThemeData.colorAccent,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyThemeData.primaryColor,
      ));

  static final darkTheme = ThemeData(
      primaryColor: MyThemeData.primaryColor,
      accentColor: MyThemeData.colorAccent,
      scaffoldBackgroundColor: MyThemeData.colorBlack,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyThemeData.primaryColor,
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return ChangeNotifierProvider(
       create: (context)=>LocalizationProvider(),
       builder: (context,widget){
         return ChangeNotifierProvider(
           create: (context)=>ThemeProvider(),
           builder: (context,widget){
             final themeProvider = Provider.of<ThemeProvider>(context);
             final localeProvider = Provider.of<LocalizationProvider>(context);
             return MaterialApp(
               localizationsDelegates: [
                 AppLocalizations.delegate,
                 GlobalMaterialLocalizations.delegate,
                 GlobalWidgetsLocalizations.delegate,
                 GlobalCupertinoLocalizations.delegate,
               ],
               supportedLocales:AppLocalizations.supportedLocales,
               locale: Locale(localeProvider.locale,''),
               themeMode: themeProvider.themeMode,
               theme: MyThemeData.lightTheme,
               darkTheme: MyThemeData.darkTheme,
               routes: {
                 HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
                 EditTask.ROUTE_NAME: (context) => EditTask()
               },
               initialRoute: HomeScreen.ROUTE_NAME,
             );
           },
         );
       },
     );
  }
}
