import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_todo_app/widgets/todo.dart';
part 'todo_list.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  List<Todo> build() {
    return [];
  }
}
