import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/providers/LocalizationProvider.dart';
import 'package:todo_app_mon/providers/ThemeProvider.dart';
import 'package:todo_app_mon/ui/home/settings/LocaleBottomSheet.dart';
import 'package:todo_app_mon/ui/home/settings/ThemeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).theme,
            style: TextStyle(
            fontWeight: FontWeight.bold,
              color: MyThemeData.colorAccent
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
                      Text(AppLocalizations.of(context).dark):
                      Text(AppLocalizations.of(context).light)
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context).language,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyThemeData.colorAccent
            ),),
          InkWell(
            onTap: (){
              showLocaleBottomSheet();
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
              localizationProvider.locale=='en'?
                  Text('English'):
                  Text('العربيه')
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

  void showLocaleBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext){
      return LocaleBottomSheet();
    });
  }
}
