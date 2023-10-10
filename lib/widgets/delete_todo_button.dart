import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/todo_list.dart';

class DeleteTodoButton extends ConsumerWidget {
  // final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteTodoButton({
    super.key,
    // required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.trashCan),
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('TODOの削除'),
          content: const Text('完了したTODOを全て削除しますか？'),
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
              onPressed: () {
                final notifier = ref.read(todoListNotifierProvider.notifier);
                notifier.removeTodo();
                Navigator.pop(context);
              },
              child: const Text(
                '削除',
                style: TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
