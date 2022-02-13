import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/services/task_service.dart';

class TaskProvider with ChangeNotifier {
  TaskService taskService = TaskService();
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks].where((e) => !e.isChecklist).toList();
  }

  int get totalTask {
    return _tasks.where((e) => !e.isChecklist).length;
  }

  int get totalTaskCompleted {
    return _tasks.where((e) => e.isChecklist).length;
  }

  void completedtask(int id) {
    Task task = _tasks.firstWhere((e) => e.id == id);
    task.isChecklist = true;
    notifyListeners();
  }

  Future<void> fetchTask() async {
    _tasks = await taskService.fetchTask();
    notifyListeners();
  }
}
