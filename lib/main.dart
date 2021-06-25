import 'package:flutter/material.dart';
import 'package:todo_app_mon/ui/EditTask/EditTask.dart';
import 'package:todo_app_mon/ui/home/HomeScreen.dart';
import 'package:todo_app_mon/ui/home/database/MyDataBase.dart';

void main() {
  initDataBase();
  runApp(MyApp());
}

class MyThemeData{
  static final primaryColor = Color.fromRGBO(93, 156, 236, 1.0);
  static final colorBlack = Color.fromRGBO(54, 54, 54, 1.0);
  static final colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static final colorAccent = Color.fromRGBO(223, 236, 219, 1.0);

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:MyThemeData.primaryColor,
        accentColor: MyThemeData.colorAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.primaryColor,
        )
      ),
      routes: {
        HomeScreen.ROUTE_NAME : (context)=>HomeScreen(),
        EditTask.ROUTE_NAME: (context)=>EditTask()
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
