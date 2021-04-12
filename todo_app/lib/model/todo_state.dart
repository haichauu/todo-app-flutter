import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_item.dart';

@immutable
class TodoState {
  final List<TodoItem> todoList;

  TodoState({@required this.todoList});

  factory TodoState.initial() {
    return TodoState(
      todoList: []
    );
  }


  TodoState copyWith({
    List<TodoItem> todoList
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoState &&
              runtimeType == other.runtimeType &&
              todoList == other.todoList;

  @override
  int get hashCode =>
      todoList.hashCode;
}