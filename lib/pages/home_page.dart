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
  final _controller = TextEditingController();

  List<Todo> todoList = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index] = !todoList[index].isCompleted
          ? todoList[index].copyWith(isCompleted: true)
          : todoList[index].copyWith(isCompleted: false);
    });
  }

  void addNewTodo() {
    if (_controller.text != '') {
      setState(() {
        Todo newTodo = Todo(title: _controller.text);
        todoList.add(newTodo);
        _controller.clear();
      });
    }
    Navigator.pop(context);
  }

  void deleteTodo() {
    setState(() {
      todoList = todoList.where((todo) => !todo.isCompleted).toList();
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
              key: ValueKey(todoList[index]),
              child: TodoCard(
                todo: todoList[index],
                onChanged: (value) => checkBoxChanged(value, index),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex--;
                final Todo todo = todoList.removeAt(oldIndex);
                todoList.insert(newIndex, todo);
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
