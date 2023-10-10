import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/pages/setting_page.dart';
import 'package:simple_todo_app/widgets/delete_todo_button.dart';
import 'package:simple_todo_app/widgets/add_todo_button.dart';
import 'package:simple_todo_app/widgets/todo_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        actions: const [
          DeleteTodoButton(),
          SizedBox(width: 15),
        ],
      ),
      body: const TodoListView(),
      floatingActionButton: const AddTodoButton(),
    );
  }
}
