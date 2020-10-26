import 'package:ToDoList/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import 'package:ToDoList/task_model.dart';

class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40.0, 50.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<Tasks>(context, listen: false)
                          .deleteCompleteTasks();
                    },
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'To Do List',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${Provider.of<Tasks>(context).incompleteTasks} Tasks',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.greenAccent,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: TaskList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              tasks: Provider.of<Tasks>(context).tasks,
            ),
          );
        },
        elevation: 20.0,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
