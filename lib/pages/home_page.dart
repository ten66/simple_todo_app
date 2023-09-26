import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: const Icon(Icons.settings_outlined),
        actions: const [
          Icon(Icons.sort_outlined),
          SizedBox(width: 15),
        ],
      ),
      body: const Center(
        child: Text('リスト一覧画面'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAppBarColor,
        onPressed: () => showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('タスク追加'),
            // content: const TextField(
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Password',
            //   ),
            // ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: kAppBarColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Add'),
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
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
