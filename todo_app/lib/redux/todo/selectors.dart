import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/model/todo_item.dart';

List<TodoItem> todoListSelector(AppState state) => state.todoState.todoList;
List<TodoItem> incompleteTodoListSelector(AppState state) => state.todoState.todoList.where((element) => element.isCompleted == false).toList();
List<TodoItem> completeTodoListSelector(AppState state) => state.todoState.todoList.where((element) => element.isCompleted == true).toList();


