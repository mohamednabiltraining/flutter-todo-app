import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_mon/ui/home/database/modal/Todo.dart';

class AddTodoBottomSheet extends StatefulWidget {
  @override
  _AddTodoBottomSheetState createState() => _AddTodoBottomSheetState();
}


class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  String title='';
  String content ='';
  DateTime date = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add Todo',textAlign: TextAlign.center,),
          ),
          TextField(
            onChanged: (newText){
              title = newText;
            },
            decoration: InputDecoration(labelText: 'Title',
            contentPadding:EdgeInsets.all(8)),
          ),
          TextField(
            maxLines: 4,
            minLines: 4,
            decoration: InputDecoration(labelText: 'content',
                contentPadding:EdgeInsets.all(8)),
            onChanged: (newText){
              content = newText;
            },
          ),
          InkWell(
            onTap: (){
              choosDateForTodo();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
              child: date  ==null?
              Text('select Date',textAlign: TextAlign.start,):
                  Text(date.toString())
            ),
          ),
          ElevatedButton(onPressed: (){
            addTodoItem();
          }, child:
          Text('Add Todo'))
        ],
      ),
    );
  }
  void addTodoItem()async{
    //Todo: validation input fields
    if(title.isEmpty){
      // show error message you should enter title
    }
    Todo todo = Todo(title:title,content:content,dateTime:date);
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.add(todo);
    Navigator.pop(context);

  }
  void choosDateForTodo()async{
    var choosenDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    date  = choosenDate;

  }
}
