import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool changeTaskState;
  final String text;
  final Function onChanged;
  final Function onLongPressed;
  TaskTile({
    @required this.text,
    @required this.changeTaskState,
    @required this.onChanged,
    @required this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF1D1E33),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: ListTile(
          onLongPress: onLongPressed,
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              text,
              style: TextStyle(
                decoration: changeTaskState ? TextDecoration.lineThrough : null,
                fontSize: 20.0,
                color: changeTaskState
                    ? Colors.grey.shade600
                    : Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: Checkbox(
            value: changeTaskState,
            onChanged: onChanged,
            activeColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxStateBool;
  final Function onChanged;
  TaskCheckBox({
    @required this.checkboxStateBool,
    @required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxStateBool,
      onChanged: onChanged,
      activeColor: Colors.transparent,
    );
  }
}
