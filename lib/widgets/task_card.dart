import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            // check box
            // Checkbox(value: value, onChanged: onChanged),

            // task name
            Text('友達に電話をかける'),
          ],
        ),
        decoration: BoxDecoration(
          color: kTaskCardColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
