import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/pages/home_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_app/todo_item.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoItemAdapter());
  var box = await Hive.openBox<TodoItem>('todoBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO APP',
      theme: ThemeData(
        // theme変更機能を設定時に使用予定
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // brightness: Brightness.dark,
        // brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: kAppBarColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const HomePage(),
    );
  }
}
