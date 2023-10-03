import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_todo_app/constants.dart';

class DeleteTaskButton extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteTaskButton({
    super.key,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.trashCan),
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('タスクの削除'),
          content: const Text('完了したタスクを全て削除しますか？'),
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
              onPressed: onDelete,
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
