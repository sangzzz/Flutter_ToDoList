import 'package:ToDoList/widgets/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ToDoList/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final List<Task> tasks;
  AddTaskScreen({@required this.tasks});
  @override
  Widget build(BuildContext context) {
    String newTask;
    TextEditingController controller = TextEditingController();
    return Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                onChanged: (newString) {
                  newTask = newString;
                },
                maxLengthEnforced: true,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter the task here...',
                ),
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  print('dnasjd');
                  if (newTask != null) {
                    Provider.of<Tasks>(context, listen: false).addTask(newTask);
                  }
                  controller.clear();
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
