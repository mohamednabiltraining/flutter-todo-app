import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
          onTap: (){
            if(themeProvider.isDarkModeEnabled())
              themeProvider.toggleTheme();
            Navigator.pop(context);
          },
            child: Container(
              padding: EdgeInsets.all(8),
              child: getRow('Light', !themeProvider.isDarkModeEnabled()),
            ),
          ),InkWell(
            onTap: (){
              if(!themeProvider.isDarkModeEnabled())
                themeProvider.toggleTheme();
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: getRow('Dark', themeProvider.isDarkModeEnabled()),
            ),
          ),
        ],

      ),
    );
  }

  Widget getRow(String data,bool isChecked){
    if(isChecked)
      return Row(
        children: [
          Expanded(child: Text(data,style: TextStyle(
            color: MyColors.primaryColor
          ),)),
          Icon(Icons.check,color: MyColors.primaryColor,)
        ],
      );
    else
      return Row(
        children: [
          Expanded(child: Text(data,)),
        ],
      );
  }
}
