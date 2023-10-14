import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/todo_list.dart';
import 'package:simple_todo_app/widgets/todo.dart';

class TodoCard extends ConsumerWidget {
  final Todo todo;

  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: kTodoCardColor,
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            final notifier = ref.read(todoListNotifierProvider.notifier);
            notifier.toggleCompleted(todo.id);
          },
          activeColor: kCheckBoxColor,
          checkColor: kTodoCardColor,
        ),
        title: Text(
          todo.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            fontSize: 16,
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 1.8,
          ),
        ),
      ),
    );
  }
}
