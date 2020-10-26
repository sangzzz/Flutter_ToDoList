import 'package:flutter/material.dart';
import 'widgets/tasks.dart';

class Tasks extends ChangeNotifier {
  List<Task> tasks = [];
  int incompleteTasks = 0;
  void addTask(String newTask) {
    tasks.add(Task(task: newTask));
    _updateIncompleteTasks();
    notifyListeners();
  }

  void _updateIncompleteTasks() {
    int count = 0;
    for (Task task in tasks) {
      if (!task.status) {
        count++;
      }
    }
    incompleteTasks = count;
  }

  void toggleStatus(int index) {
    tasks[index].toggleStatus();
    _updateIncompleteTasks();
    notifyListeners();
  }

  void deleteAtPosition(int index) {
    tasks.removeAt(index);
    _updateIncompleteTasks();
    notifyListeners();
  }

  void deleteCompleteTasks() {
    List<Task> newTasks = [];
    for (Task task in tasks) {
      if (!task.status) {
        newTasks.add(task);
      }
    }
    tasks = newTasks;
    _updateIncompleteTasks();
    notifyListeners();
  }
}
