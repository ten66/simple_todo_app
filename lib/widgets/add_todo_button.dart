import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_app/todo_list.dart';
import 'package:simple_todo_app/widgets/todo.dart';
import 'package:uuid/uuid.dart';

class AddTodoButton extends ConsumerWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var uuid = const Uuid();
    final controller = TextEditingController();

    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      shape: const CircleBorder(),
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
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.clear();
                Navigator.pop(context);
              },
              child: Text(
                'キャンセル',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (controller.text != '') {
                  final notifier = ref.read(todoListNotifierProvider.notifier);
                  String id = uuid.v4();
                  Todo newTodo = Todo(id: id, title: controller.text);
                  notifier.addTodo(newTodo);
                  controller.clear();
                }
                Navigator.pop(context);
              },
              child: Text(
                '追加',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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
