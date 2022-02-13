import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  TaskProvider() {
    _tasks.add(Task(id: 1, title: "Olahraga Pagi", isChecklist: false));
    _tasks.add(Task(id: 2, title: "Sarapan", isChecklist: false));
    _tasks.add(Task(id: 3, title: "Baca Buku", isChecklist: false));
    _tasks
        .add(Task(id: 4, title: "Istirahat & Makan Siang", isChecklist: false));
    _tasks.add(Task(id: 5, title: "Minum Obat Siang", isChecklist: false));
    _tasks.add(Task(id: 6, title: "Minum Obat Malam", isChecklist: false));
    _tasks.add(Task(id: 7, title: "Minum Obat Pagi", isChecklist: true));
    notifyListeners();
  }

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
}
