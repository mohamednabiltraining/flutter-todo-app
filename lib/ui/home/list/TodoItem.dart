import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_mon/main.dart';
import 'package:todo_app_mon/ui/home/database/modal/Todo.dart';

class TodoItem extends StatelessWidget {
  Todo todo;
  Function onDeleteAction;
  TodoItem(this.todo,this.onDeleteAction);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:4,horizontal: 12),
      child: Slidable(
        closeOnScroll: true,
        actionExtentRatio: .3,
        child: Container(
          decoration: BoxDecoration(
            color: MyThemeData.colorWhite,
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: MyThemeData.primaryColor,
                ),
                width: 4,
                height: 80,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(todo.title,style:
                        TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: MyThemeData.primaryColor),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Icon(Icons.calendar_today_outlined),
                            Text(todo.dateTime.toString(),textAlign: TextAlign.center,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyThemeData.primaryColor,
                  ),
                child: Image(image: AssetImage('assets/images/icon_check.png'),),
              )
            ],
          ),
        ),
        actionPane: SlidableScrollActionPane(),
        actions: [

          IconSlideAction(
            onTap: (){
              onDeleteAction(todo);
            },
            color: Colors.transparent,
            iconWidget: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)
                    ,bottomLeft: Radius.circular(12))
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,color: Colors.white,),
                    Text('delete',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
