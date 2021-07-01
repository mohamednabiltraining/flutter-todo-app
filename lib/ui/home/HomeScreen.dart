import 'package:flutter/material.dart';
import 'package:todo_app_mon/ui/home/AddTodo/AddTodoBottomSheet.dart';
import 'package:todo_app_mon/ui/home/list/TodoListFragment.dart';
import 'package:todo_app_mon/ui/home/settings/SettingsFragment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static final ROUTE_NAME ='home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          openAddTodo();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(AppLocalizations.of(context).appTitle),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int position){
            setState(() {
              selectedIndex=position;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
                icon: ImageIcon(AssetImage('assets/images/ic_list.png'))
            ),
            BottomNavigationBarItem(
              label: 'Settings',
                icon: ImageIcon(AssetImage('assets/images/ic_settings.png'))
            ),
          ],
        ),
      ),
      body: getSelectedWidget(),
    );
  }
  void openAddTodo(){
    showModalBottomSheet(context: context, builder: (builder){
        return AddTodoBottomSheet();
      },
    isScrollControlled: true
    );
  }
  Widget getSelectedWidget(){
    if(selectedIndex==0)
      return TodoListFragment();
    return SettingsFragment();
  }
}
