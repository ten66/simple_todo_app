import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  final List task;
  final Function(bool?)? onChanged;

  const TaskCard({
    super.key,
    required this.task,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // key: Key('$index'),
      color: kTaskCardColor,
      child: ListTile(
        leading: Checkbox(
          value: task[1],
          onChanged: onChanged,
          activeColor: kCheckBoxColor,
          checkColor: kTaskCardColor,
        ),
        title: Text(
          task[0],
          style: TextStyle(
            fontSize: 16,
            decoration:
                task[1] ? TextDecoration.lineThrough : TextDecoration.none,
            decorationThickness: 1.8,
          ),
        ),
      ),
    );
  }
}
