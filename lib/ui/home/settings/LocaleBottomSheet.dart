import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/providers/LocalizationProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';

class LocaleBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localProvider = Provider.of<LocalizationProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              if(localProvider.locale!='en')
                localProvider.changeLocale('en');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getRow('English', localProvider.locale=='en')
            ),
          ),
          InkWell(
            onTap: (){
              if(localProvider.locale!='ar')
                localProvider.changeLocale('ar');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: getRow('العربيه',localProvider.locale == 'ar')
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
