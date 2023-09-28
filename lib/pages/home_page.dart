import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/widgets/task_card.dart';

import '../widgets/add_task_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List taskList = [
    ['友達に電話する', false],
    ['洗濯する', false],
    ['勉強する', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_outlined),
          ),
          const SizedBox(width: 15),
        ],
      ),
      // タスクデータがない時用の画面
      // body: const Center(
      //   child: Text('No Task!!'),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => TaskCard(
            taskName: taskList[index][0],
            taskCompleted: taskList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          ),
        ),
      ),
      floatingActionButton: const AddTaskButton(),
    );
  }
}
