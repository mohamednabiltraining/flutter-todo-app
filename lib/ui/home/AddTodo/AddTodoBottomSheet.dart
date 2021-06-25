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
  bool titleError=false,contentError=false,dateError=false;

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
              if(!newText.isEmpty){
                this.setState(() {
                  titleError=false;
                  print('in if statement');
                });
              }
              title = newText;
            },
            decoration: InputDecoration(
                errorText:titleError?'Please enter a valid title':null,
                labelText: 'Title',
            contentPadding:EdgeInsets.all(8)),
          ),
          TextField(
            maxLines: 4,
            minLines: 4,
            decoration: InputDecoration(labelText: 'content',
                errorText: contentError?'Please enter a valid content':null,
                contentPadding:EdgeInsets.all(8)),
            onChanged: (newText){
              if(!newText.isEmpty){
                this.setState(() {
                  contentError=false;
                });
              }
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
              Text('select Date',textAlign: TextAlign.start,
                style: TextStyle(color: dateError?Colors.red:Colors.black),):
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
     if(!valid()) return;
    Todo todo = Todo(title:title,content:content,dateTime:date);
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.add(todo);
    Navigator.pop(context);

  }
  bool valid(){
    bool valid= true;
    if(title.isEmpty){
      this.setState(() {
        titleError=true;
        valid=false;
      });
    }
    if(content.isEmpty){
      this.setState(() {
        contentError=true;
        valid=false;
      });
    }
    if(date==null){
      this.setState(() {
        dateError=true;
        valid=false;
      });
    }
    return valid;
  }
  void choosDateForTodo()async{
    var choosenDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    this.setState(() {
      date  = choosenDate;
      if(date!=null){
        dateError=false;
      }
    });

  }
}
