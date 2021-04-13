import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/constant/title_app_bar.dart';
import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/redux/nav/nav_actions.dart';
import 'package:todo_app/redux/nav/selectors.dart';
import 'package:todo_app/redux/reducer.dart';
import 'package:todo_app/redux/todo/selectors.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';
import 'package:todo_app/screens/complete_todos_screen.dart';

void main() {
  group('The Selectors', () {
    Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );
    });

    group('Todo selectors', () {
      setUp(() {
        for (int i = 0; i < 10; i++) {
          TodoItem todoItem = new TodoItem(name: 'test $i', createdAt: DateTime.now(), isCompleted: i%2 == 0 ? true : false);
          store.dispatch(AddTodoItemAction(todoItem: todoItem));
        }
      });

      test('with todoListSelector ', () {
        List<TodoItem> result = todoListSelector(store.state);
        expect(result.length, 10);
      });

      test('with incompleteTodoListSelector ', () {
        List<TodoItem> result = incompleteTodoListSelector(store.state);
        expect(result.length, 5);
      });

      test('with completeTodoListSelector ', () {
        List<TodoItem> result = completeTodoListSelector(store.state);
        expect(result.length, 5);
      });
    });
    group('Nav selectors', () {
      setUp(() {
        store.dispatch(NavigateToScreenAction(index: 1));
      });

      test('with currentScreenSelector ', () {
        Widget result = currentScreenSelector(store.state);
        expect(result.runtimeType, CompleteTodosScreen().runtimeType);
      });

      test('with currentScreenTitleSelector ', () {
        String result = currentScreenTitleSelector(store.state);
        expect(result, completeTodoScreenTitle);
      });

      test('with currentIndexSelector ', () {
        int result = currentIndexSelector(store.state);
        expect(result, 1);
      });
    });

  });
}
