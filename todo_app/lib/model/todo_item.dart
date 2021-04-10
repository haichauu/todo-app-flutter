import 'package:flutter/foundation.dart';
import '../constant/todo_status.dart';

class TodoItem {
  final String name;
  final String description;
  final TodoStatus status;

  TodoItem({
    @required this.name,
     this.description,
    this.status
  });

  TodoItem copyWith({String name, String description}) {
    return TodoItem(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}