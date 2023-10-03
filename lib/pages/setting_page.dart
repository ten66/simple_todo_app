import 'package:flutter/material.dart';
import 'package:simple_todo_app/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '設定',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
