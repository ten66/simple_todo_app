import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/pages/setting_page.dart';
import 'package:simple_todo_app/widgets/delete_todo_button.dart';
import 'package:simple_todo_app/widgets/todo.dart';
import 'package:simple_todo_app/widgets/todo_card.dart';
import 'package:simple_todo_app/widgets/add_todo_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  List todoList = [];
  List<Todo> subTodoList = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
    // setState(() {
    //   subTodoList[index] = !subTodoList[index].isCompleted
    //       ? subTodoList[index].copyWith(isCompleted: true)
    //       : subTodoList[index].copyWith(isCompleted: false);
    // });
  }

  // taskListにtaskを追加する処理
  void addNewTodo() {
    // textfieldが空欄かどうか
    if (_controller.text != '') {
      setState(() {
        todoList.add([_controller.text, false]);
        _controller.clear();
      });
    }
    Navigator.pop(context);
  }

  // checkBoxがtrueのtaskを削除する処理
  void deleteTodo() {
    setState(() {
      todoList = todoList.where((task) => !task[1]).toList();
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
          DeleteTodoButton(
            onDelete: deleteTodo,
            onCancel: () => Navigator.pop(context),
          ),
          const SizedBox(width: 15),
        ],
      ),
      // taskListにデータがあるか無いかで画面描画を変更する
      body: Visibility(
        visible: todoList.isEmpty,
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
            itemCount: todoList.length,
            itemBuilder: (context, index) => Container(
              key: Key('$index'),
              child: TodoCard(
                todo: todoList[index],
                onChanged: (value) => checkBoxChanged(value, index),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex--;
                final List task = todoList.removeAt(oldIndex);
                todoList.insert(newIndex, task);
              });
            },
          ),
        ),
        child: const Center(
          child: Text('TODOがありません'),
        ),
      ),
      floatingActionButton: AddTodoButton(
        controller: _controller,
        onAdd: addNewTodo,
        onCancel: () => Navigator.pop(context),
      ),
    );
  }
}
