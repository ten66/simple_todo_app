import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/widgets/todo.dart';

class TodoCard extends StatelessWidget {
  // final List todo;
  final Todo todo;
  final Function(bool?)? onChanged;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kTodoCardColor,
      child: ListTile(
        leading: Checkbox(
          // value: todo[1],
          value: todo.isCompleted,
          onChanged: onChanged,
          activeColor: kCheckBoxColor,
          checkColor: kTodoCardColor,
        ),
        title: Text(
          // todo[0],
          todo.title,
          style: TextStyle(
            fontSize: 16,
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            // todo[1] ? TextDecoration.lineThrough : TextDecoration.none,
            decorationThickness: 1.8,
          ),
        ),
      ),
    );
  }
}
