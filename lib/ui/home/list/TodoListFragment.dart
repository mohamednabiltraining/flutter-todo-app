import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/ui/EditTask/EditTask.dart';
import 'package:todo_app_mon/ui/home/database/modal/Todo.dart';
import 'package:todo_app_mon/ui/home/list/TodoItem.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TodoListFragment extends StatefulWidget {
  @override
  _TodoListFragmentState createState() => _TodoListFragmentState();
}

class _TodoListFragmentState extends State<TodoListFragment> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<Todo> todosList = [];
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('TodoListScreen'),
      onVisibilityChanged: (visibilityInfo) {
        getAllTodosFromBox();
      },
      child: Container(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now().subtract(Duration(days: 30)),
              lastDay: DateTime.now().add(Duration(days: 30)),
              calendarStyle: CalendarStyle(
                selectedTextStyle:
                    TextStyle(fontSize: 16, color: MyThemeData.colorWhite),
                selectedDecoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultTextStyle:
                    TextStyle(fontSize: 16, color: MyThemeData.colorBlack),
                isTodayHighlighted: false,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              )),
              focusedDay: focusedDay,
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
              selectedDayPredicate: (day) {
                return isSameDay(day, selectedDay);
              },
              weekendDays: [],
              onDaySelected: (newSelectedDate, newFocusedDay) {
                setState(() {
                  selectedDay = newSelectedDate;
                  focusedDay = newFocusedDay;
                });

                getAllTodosFromBox();
              },
            ),
            Expanded(
              child: todosList.length > 0
                  ? ListView.builder(
                      itemCount: todosList.length,
                      itemBuilder: (context, index) {
                        return TodoItem(todosList[index], onDeleteTask,onItemCheck,onItemPressed);
                      })
                  : Center(child: Text('no todos for this day')),
            )
          ],
        ),
      ),
    );
  }

  void onDeleteTask(Todo item) async {
    print(item.title);
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    int index = box.values.toList().indexOf(item);
    box.deleteAt(index);
    getAllTodosFromBox();

//    box.putAt(index, Todo(a;lksdmf;laksmfd))
  }
  void onItemCheck(Todo item) async {
    print('item before change its state is ${item.isDone}');
    var box= await Hive.openBox<Todo>(Todo.BOX_NAME);
    int index =box.values.toList().indexOf(item);
    item.isDone=item.isDone?false:true;
    box.putAt(index, item);
    print(box.values.toList().elementAt(index).isDone);
   getAllTodosFromBox();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTodosFromBox();
  }
  onItemPressed(Todo item,BuildContext context)async{
    var box= await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.close();
    print(box.isOpen);
    Navigator.of(context).pushNamed(EditTask.ROUTE_NAME,arguments:item);
  }
  void getAllTodosFromBox() async {
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    setState(() {
      todosList = box.values
          .where((item) => isSameDay(item.dateTime, selectedDay))
          .toList();
    });
  }
}
