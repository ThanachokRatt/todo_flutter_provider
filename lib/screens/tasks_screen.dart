import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var task = context.watch<TaskData>().tasks;
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(top: 60.0, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  )),
              SizedBox(height: 10.0),
              Text(
                'Todoey',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700),
              ),
              Text('${task.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
            ],
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TasksList()),
        )
      ]),
    );
  }
}
