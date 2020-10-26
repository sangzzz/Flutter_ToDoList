import 'package:flutter/material.dart';
import 'screens/todolist_screen.dart';
import 'package:provider/provider.dart';
import 'task_model.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return ChangeNotifierProvider<Tasks>(
      create: (context) => Tasks(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: ToDoListScreen(),
      ),
    );
  }
}
