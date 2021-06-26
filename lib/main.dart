import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/LocalProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/EditTask/EditTask.dart';
import 'package:todo_app_mon/ui/home/HomeScreen.dart';
import 'package:todo_app_mon/ui/home/database/MyDataBase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    return ChangeNotifierProvider(
      create: (context)=>LocaleProvider(),
      builder: (context,builder){
        return ChangeNotifierProvider(
          create: (context)=>ThemeProvider(),
          builder: (context,builder){
            final themeProvider = Provider.of<ThemeProvider>(context);
            final localeProvider = Provider.of<LocaleProvider>(context);
            return  MaterialApp(
              locale: Locale.fromSubtags(languageCode: localeProvider.locale)
              ,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate, // Add this line
              ],
              supportedLocales: AppLocalizations.supportedLocales
              ,
              title: 'Route Todo',
              initialRoute: HomeScreen.ROUTE_NAME,
              themeMode:themeProvider.themMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              routes: {
                HomeScreen.ROUTE_NAME: (context)=>HomeScreen(),
                EditTask.ROUTE_NAME: (context)=>EditTask()
              },
            );

          },
        );

      },
    );
  }
}
