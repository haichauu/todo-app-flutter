import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/model/todo_state.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';
import 'package:todo_app/redux/todo/todo_reducer.dart';

void main() {
  group('The todoReducer', () {
    Reducer<TodoState> todoReducerTest;
    Store<TodoState> store;

    setUp(() {
      todoReducerTest = todoReducer;

      store = Store<TodoState>(
        todoReducerTest,
        initialState: TodoState.initial(),
      );
    });

    test('todo state should init', () {
      expect(store.state.todoList, []);
    });

    group('dispatch AddITodotemAction', () {
      TodoItem todoItem = TodoItem(name: 'test', createdAt: DateTime.now());

      setUp(() {
        store.dispatch(AddTodoItemAction(todoItem: todoItem));
      });

      test('should return list length is 1', () {
        expect(store.state.todoList.length, 1);
      });

      test('should have first item is equal todoItem', () {
        expect(store.state.todoList[0], todoItem);
      });
    });
  });
}