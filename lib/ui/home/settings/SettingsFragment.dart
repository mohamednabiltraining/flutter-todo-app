import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/home/settings/ThemeBottomSheet.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mode',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyThemeData.colorBlack
          ),),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: MyThemeData.primaryColor,width: 1),
                color: MyThemeData.colorWhite
              ),
              child: Row(
                children: [
                  Expanded(child:
                      themeProvider.isDarkModeEnabled()?
                      Text('Dark'):
                      Text('Light')
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context,builder:(buildContext){
      return ThemeBottomSheet();
    });
  }
}
