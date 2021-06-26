
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/ui/home/database/modal/Todo.dart';

class EditTask extends StatefulWidget {
  static final ROUTE_NAME = 'edit_task';

  const EditTask({Key key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  Todo todo;
  bool titleError=false,contentError=false,dateError=false;
  String title,content;
  DateTime date;
   int buildTimeCounter=0;
  @override
  Widget build(BuildContext context) {
   if(buildTimeCounter==0){
   todo=ModalRoute.of(context).settings.arguments as Todo;
   title=todo.title;
   content=todo.content;
   date=todo.dateTime;
   buildTimeCounter++;
   }
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: MyThemeData.colorAccent,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: MyThemeData.primaryColor,
            padding: EdgeInsets.only(bottom: 120),
            child: AppBar(
              elevation: 0,
              title: Text('To Do List'),
            ),
          ),
        ),

        Positioned(
          top: 100,
          right: 40,
          left: 40,
          bottom: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(20))
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text('Edit Task',textAlign: TextAlign.center
                    ,style: TextStyle(fontWeight:FontWeight.bold,fontSize:18,color: MyThemeData.colorBlack), ),
                ),
              SizedBox(height: 16,),
                TextFormField(
                  initialValue: title,
                  onChanged: (newText){
                    if(!newText.isEmpty){
                      this.setState(() {
                        titleError=false;
                      });
                    }
                    title = newText;
                  },
                  decoration: InputDecoration(
                      errorText:titleError?'Please enter a valid title':null,
                      labelText: 'Title',
                      contentPadding:EdgeInsets.all(8)),
                ),
                TextFormField(
                  initialValue: content,
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
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 50,right: 30,left: 30),
                  child: ElevatedButton(onPressed: (){
                   saveChanges(context);
                  }, child:
                  Text('Save Changes',style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 16,right: 16)),
                      backgroundColor: MaterialStateProperty.all(MyThemeData.primaryColor),shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))
                    
                  ))),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
  void saveChanges(BuildContext context) async{
    if(!valid())return ;

    var box= await Hive.openBox<Todo>(Todo.BOX_NAME);
    List<Todo> list=box.values.toList();
    int index=0;
     print(todo.title);
    print(todo.content);
    print(todo.dateTime);
    for(int i=0;i<list.length;i++){
      if(todo.title==list[i].title){
        index=i;
      }
    }
   box.putAt(index, new Todo(title: title,content: content,dateTime:date,isDone: todo.isDone ));
   Navigator.of(context).pop();
  }
  void choosDateForTodo()async{
    var choosenDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    this.setState(() {
     date = choosenDate;
      if(date!=null){
        dateError=false;
      }
    });
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
}
