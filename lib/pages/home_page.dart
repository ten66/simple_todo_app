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
      ),
      body: const Center(
        child: Text('リスト一覧画面'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAppBarColor,
        onPressed: () {},
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
