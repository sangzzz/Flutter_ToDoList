import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
import 'package:ToDoList/task_model.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              text: taskData.tasks[index].task,
              changeTaskState: taskData.tasks[index].status,
              onChanged: (bool newValue) {
                taskData.toggleStatus(index);
              },
              onLongPressed: () {
                taskData.deleteAtPosition(index);
              },
            );
          },
          itemCount: Provider.of<Tasks>(context).tasks.length,
        );
      },
    );
  }
}
