import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/constant/title_app_bar.dart';
import 'package:todo_app/model/nav_state.dart';
import 'package:todo_app/redux/nav/nav_actions.dart';
import 'package:todo_app/redux/nav/nav_reducer.dart';
import 'package:todo_app/screens/complete_todos_screen.dart';
import 'package:todo_app/screens/incomplete_todos_screen.dart';
import 'package:todo_app/screens/todos_screen.dart';

void main() {
  group('The navReducer', () {
    Reducer<NavState> navReducerTest;
    Store<NavState> store;

    setUp(() {
      navReducerTest = navReducer;

      store = Store<NavState>(
        navReducerTest,
        initialState: NavState.initial(),
      );
    });

    test('nav state should init', () {
      expect(store.state.currentIndex, 0);
      expect(store.state.currentScreen.runtimeType, TodosScreen().runtimeType);
      expect(store.state.currentScreenTitle, todoScreenTitle);

    });


    group('dispatch NavigateToScreenAction', () {
      group('navigate with index is 0', () {
        final int currentIndex = 0;

        setUp(() {
          store.dispatch(NavigateToScreenAction(index: currentIndex));
        });

        test('should set current index is 0', () {
          expect(store.state.currentIndex, currentIndex);
        });

        test('should set the current screen is TodosSCreen', () {
          expect(store.state.currentScreen.runtimeType, TodosScreen().runtimeType);
        });

        test('should set the current screen title is $todoScreenTitle', () {
          expect(store.state.currentScreenTitle, todoScreenTitle);
        });
      });

      group('navigate with index is 1', () {
        final int currentIndex = 1;

        setUp(() {
          store.dispatch(NavigateToScreenAction(index: currentIndex));
        });

        test('should set current index is 1', () {
          expect(store.state.currentIndex, currentIndex);
        });

        test('should set the root screen is CompleteTodosScreen', () {
          expect(store.state.currentScreen.runtimeType, CompleteTodosScreen().runtimeType);
        });

        test('should set the current screen title is $completeTodoScreenTitle', () {
          expect(store.state.currentScreenTitle, completeTodoScreenTitle);
        });
      });

      group('navigate with index is 2', () {
        final int currentIndex = 2;

        setUp(() {
          store.dispatch(NavigateToScreenAction(index: currentIndex));
        });

        test('should set current index is 2', () {
          expect(store.state.currentIndex, currentIndex);
        });

        test('should set the root screen is IncompleteTodosScreen', () {
          expect(store.state.currentScreen.runtimeType, IncompleteTodosScreen().runtimeType);
        });

        test('should set the current screen title is $incompleteScreenTitle', () {
          expect(store.state.currentScreenTitle, incompleteScreenTitle);
        });
      });
    });

  });
}