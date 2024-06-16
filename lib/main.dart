import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
