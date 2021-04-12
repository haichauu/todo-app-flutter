import 'package:flutter/foundation.dart';

class TodoItem {
  String name;
  bool isCompleted;
  DateTime createdAt;
  static int idCounter = 0;
  final int id = idCounter++;

  TodoItem({
    @required this.name,
    this.isCompleted = false,
    @required this.createdAt,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '${this.id}: ${this.name}, ${this.isCompleted}';
  }
}