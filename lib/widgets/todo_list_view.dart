import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../todo_list.dart';
import 'todo_card.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListNotifierProvider);

    return Visibility(
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
            ),
          ),
          onReorder: (oldIndex, newIndex) {
            final notifier = ref.read(todoListNotifierProvider.notifier);
            notifier.onReorder(oldIndex, newIndex);
          },
        ),
      ),
      child: const Center(
        child: Text('TODOがありません'),
      ),
    );
  }
}
