import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/EditTask/EditTask.dart';
import 'package:todo_app_mon/ui/home/HomeScreen.dart';
import 'package:todo_app_mon/ui/home/database/MyDataBase.dart';

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
       create: (context)=>ThemeProvider(),
       builder: (context,widget){
         final themeProvider = Provider.of<ThemeProvider>(context);
         return MaterialApp(
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
  }
}
