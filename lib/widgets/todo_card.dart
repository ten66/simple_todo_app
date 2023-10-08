import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class TodoCard extends StatelessWidget {
  final List todo;
  final Function(bool?)? onChanged;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // key: Key('$index'),
      color: kTaskCardColor,
      child: ListTile(
        leading: Checkbox(
          value: todo[1],
          onChanged: onChanged,
          activeColor: kCheckBoxColor,
          checkColor: kTaskCardColor,
        ),
        title: Text(
          todo[0],
          style: TextStyle(
            fontSize: 16,
            decoration:
                todo[1] ? TextDecoration.lineThrough : TextDecoration.none,
            decorationThickness: 1.8,
          ),
        ),
      ),
    );
  }
}
