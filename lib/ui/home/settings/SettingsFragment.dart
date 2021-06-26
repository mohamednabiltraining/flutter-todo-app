import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/providers/LocalProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/home/settings/LocaleBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theme'),
        InkWell(
          onTap: (){
            showThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: MyColors.primaryColor)
            ),
            child: Row(
           children: [
             themeProvider.isDarkModeEnabled()?
             Expanded(child: Text('Dark')):
             Expanded(child: Text('Light')),

             Icon(Icons.keyboard_arrow_down)
           ],
            ),
          ),
        ),
        Text('Locale'),
        InkWell(
          onTap: (){
            showLocaleBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: MyColors.primaryColor)
            ),
            child: Row(
              children: [
                localeProvider.locale=='en'?
                Expanded(child: Text('English')):
                Expanded(child: Text('العربيه')),

                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        )
      ],
    ),
    );
  }

  showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return ThemeBottomSheet();
    });
  }
  showLocaleBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return LocaleBottomSheet();
    });
  }
}
