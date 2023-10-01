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
  // text controller
  final _controller = TextEditingController();

  List taskList = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  // taskListにtaskを追加する処理
  void addNewTask() {
    // textfieldが空欄かどうか
    if (_controller.text != '') {
      setState(() {
        taskList.add([_controller.text, false]);
        _controller.clear();
      });
    }
    Navigator.pop(context);
  }

  // checkBoxがtrueのtaskを削除する処理
  void deleteTask() {
    setState(() {
      taskList = taskList.where((task) => !task[1]).toList();
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
            onPressed: deleteTask,
            icon: const Icon(Icons.sort_outlined),
          ),
          const SizedBox(width: 15),
        ],
      ),
      // taskListにデータがあるか無いかで画面描画を変更する
      body: Visibility(
        visible: taskList.isEmpty,
        replacement: Padding(
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
        child: const Center(
          child: Text('No Task.'),
        ),
      ),
      floatingActionButton: AddTaskButton(
        controller: _controller,
        onAdd: addNewTask,
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
}
