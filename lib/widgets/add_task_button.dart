import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AddTaskButton extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  const AddTaskButton({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kAppBarColor,
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('タスク追加'),
          content: CupertinoTextField(
            controller: controller,
            placeholder: 'task name',
            cursorColor: kAppBarColor,
          ),
          actions: [
            TextButton(
              onPressed: onCancel,
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onAdd,
              child: const Text(
                'Add',
                style: TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      tooltip: 'add task',
      child: const Icon(Icons.add),
    );
  }
}
