import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_app/todo_list.dart';
import 'package:simple_todo_app/widgets/todo.dart';
import 'package:uuid/uuid.dart';

import '../constants.dart';

class AddTodoButton extends ConsumerWidget {
  // final dynamic controller;
  // final VoidCallback onAdd;
  final VoidCallback onCancel;

  const AddTodoButton({
    super.key,
    // required this.controller,
    // required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var uuid = const Uuid();
    final controller = TextEditingController();

    return FloatingActionButton(
      backgroundColor: kAppBarColor,
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('新規TODOの追加'),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CupertinoTextField(
              controller: controller,
              placeholder: 'todo name',
              cursorColor: kAppBarColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: onCancel,
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              // onPressed: onAdd,
              onPressed: () {
                final notifier = ref.read(todoListNotifierProvider.notifier);
                String id = uuid.v4();
                Todo newTodo = Todo(id: id, title: controller.text);
                notifier.addTodo(newTodo);
              },
              child: const Text(
                '追加',
                style: TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      tooltip: 'add todo',
      child: const Icon(Icons.add),
    );
  }
}
