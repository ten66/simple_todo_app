import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_todo_app/widgets/todo.dart';
part 'todo_list.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo() {
    state = state.where((todo) => !todo.isCompleted).toList();
  }

  void toggleCompleted(String id) {
    state = state
        .map(
          (todo) => Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: (id != todo.id) ? todo.isCompleted : !todo.isCompleted,
          ),
        )
        .toList();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex--;
    final Todo todo = state.removeAt(oldIndex);
    state.insert(newIndex, todo);
  }
}
