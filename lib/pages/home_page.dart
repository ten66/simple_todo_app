import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
// import 'package:simple_todo_app/widgets/task_card.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ReorderableListView.builder(
            proxyDecorator: (child, index, animation) => Material(
              type: MaterialType.transparency,
              child: child,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: taskList.length,
            // itemBuilder: (context, index) => TaskCard(
            //   task: taskList[index],
            //   taskName: taskList[index][0],
            //   taskCompleted: taskList[index][1],
            //   onChanged: (value) => checkBoxChanged(value, index),
            // ),
            itemBuilder: (context, index) => taskCard(index, taskList[index]),
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

  Widget taskCard(int index, List task) => Card(
        key: Key('$index'),
        color: kTaskCardColor,
        child: ListTile(
          leading: Checkbox(
            value: task[1],
            onChanged: (value) => checkBoxChanged(value, index),
            activeColor: kCheckBoxColor,
            checkColor: kTaskCardColor,
          ),
          title: Text(
            task[0],
            style: TextStyle(
              fontSize: 16,
              decoration:
                  task[1] ? TextDecoration.lineThrough : TextDecoration.none,
              decorationThickness: 1.8,
            ),
          ),
        ),
      );
}
