import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TaskData extends ChangeNotifier {
  TaskData() {
    loadTasks();
  }
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getStringList('tasks');
    if (encodedData != null) {
      _tasks = encodedData.map((task) {
        final taskMap = Map<String, dynamic>.from(jsonDecode(task));
        return Task(name: taskMap['name'], isDone: taskMap['isDone']);
      }).toList();
    }
    notifyListeners();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksData = _tasks
        .map((task) => jsonEncode({'name': task.name, 'isDone': task.isDone}))
        .toList();
    prefs.setStringList('tasks', tasksData);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
    saveTasks();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    saveTasks();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
    saveTasks();
  }
}
