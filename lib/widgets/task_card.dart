import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const TaskCard({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kTaskCardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // check box
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: kCheckBoxColor,
              checkColor: kTaskCardColor,
            ),

            // task name
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
