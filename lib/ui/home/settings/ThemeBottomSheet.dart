import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider >(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              if(themeProvider.isDarkModeEnabled())
                themeProvider.toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getRow('Light', !themeProvider.isDarkModeEnabled())
            ),
          ),
          InkWell(
            onTap: (){
              if(!themeProvider.isDarkModeEnabled())
                themeProvider.toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getRow('Dark',themeProvider.isDarkModeEnabled())
            ),
          )
        ],
      ),
    );
  }

  Widget getRow(String text,bool isSelected){
    if(isSelected){
      return Row(
        children: [
          Expanded(child: Text(text,style: TextStyle(color: MyThemeData.primaryColor),),),
          Icon(Icons.check,color: MyThemeData.primaryColor,)
        ],
      );
    }else {
      return Row(
        children: [
          Expanded(child: Text(text,),),
        ],
      );
    }
  }
}
