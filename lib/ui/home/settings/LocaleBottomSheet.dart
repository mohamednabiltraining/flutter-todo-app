import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/LocalProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';

class LocaleBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
          onTap: (){
            if(localeProvider.locale!='en')
              localeProvider.changeLocale('en');
            Navigator.pop(context);
          },
            child: Container(
              padding: EdgeInsets.all(8),
              child: getRow('English', localeProvider.locale=='en'),
            ),
          ),InkWell(
            onTap: (){
              if(localeProvider.locale!='ar')
                localeProvider.changeLocale('ar');
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: getRow('العربيه', localeProvider.locale=='ar'),
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
