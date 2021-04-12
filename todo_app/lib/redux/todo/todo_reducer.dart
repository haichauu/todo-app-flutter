import 'package:redux/redux.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';

import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/model/todo_state.dart';

Reducer<TodoState> todoReducer = combineReducers([
  TypedReducer<TodoState, AddTodoItemAction>(addItemTodo),
  TypedReducer<TodoState, UpdateStatusTodoItemAction>(updateStatusTodoItem)

]);

TodoState addItemTodo(TodoState state, AddTodoItemAction action) {
  return state.copyWith(
      todoList: []..add(action.todoItem)..addAll(state.todoList)
  );
}

TodoState updateStatusTodoItem(TodoState state, UpdateStatusTodoItemAction action) {
  TodoItem item = state.todoList[state.todoList.indexWhere((element) => element.id == action.id)];
  item.isCompleted = !item.isCompleted;
  return state.copyWith(
      todoList: []..addAll(state.todoList));
}