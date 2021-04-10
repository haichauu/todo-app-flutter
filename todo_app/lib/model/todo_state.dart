import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_item.dart';

@immutable
class TodoState {
  final List<TodoItem> totoList;

  TodoState({@required this.totoList});

  factory TodoState.initial() {
    return TodoState(
      totoList: []
    );
  }


  TodoState copyWith({
    List<TodoItem> todoList
  }) {
    return TodoState(
      totoList: totoList ?? this.totoList
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoState &&
              runtimeType == other.runtimeType &&
              totoList == other.totoList;

  @override
  int get hashCode =>
      totoList.hashCode;
}