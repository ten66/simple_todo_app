import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('友達に電話をかける'),
      decoration: BoxDecoration(
        color: kTaskCardColor,
      ),
    );
  }
}
