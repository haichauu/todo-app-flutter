import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo_item.dart';

class AddTodoItemAction {
  TodoItem todoItem;
  AddTodoItemAction({@required this.todoItem});
}

class UpdateStatusTodoItemAction {
  int id;
  UpdateStatusTodoItemAction({@required this.id});
}