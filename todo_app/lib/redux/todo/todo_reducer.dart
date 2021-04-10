import 'package:redux/redux.dart';
import 'package:todo_app/model/todo_state.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';

Reducer<TodoState> todoReducer = combineReducers([
  TypedReducer<TodoState, AddTodoItemAction>(addItemTodo)
]);

TodoState addItemTodo(TodoState state, AddTodoItemAction action) {
  return state.copyWith(
    todoList: []..addAll(state.totoList)..add(action.todoItem)
  );
}