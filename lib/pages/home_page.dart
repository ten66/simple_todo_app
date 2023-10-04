import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/pages/setting_page.dart';
import 'package:simple_todo_app/widgets/delete_task_button.dart';
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
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            );
          },
        ),
        actions: [
          DeleteTaskButton(
            onDelete: deleteTask,
            onCancel: () => Navigator.pop(context),
          ),
          const SizedBox(width: 15),
        ],
      ),
      // taskListにデータがあるか無いかで画面描画を変更する
      body: Visibility(
        visible: taskList.isEmpty,
        replacement: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ReorderableListView.builder(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            proxyDecorator: (child, index, animation) => Material(
              type: MaterialType.transparency,
              child: child,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: taskList.length,
            itemBuilder: (context, index) => Container(
              key: Key('$index'),
              child: TaskCard(
                task: taskList[index],
                onChanged: (value) => checkBoxChanged(value, index),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex--;
                final List task = taskList.removeAt(oldIndex);
                taskList.insert(newIndex, task);
              });
            },
          ),
        ),
        child: const Center(
          child: Text('タスクがありません'),
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
