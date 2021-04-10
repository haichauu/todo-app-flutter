import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/constant/title_app_bar.dart';
import 'package:todo_app/model/nav_state.dart';
import 'package:todo_app/redux/nav/nav_actions.dart';
import 'package:todo_app/screens/complete_todos_screen.dart';
import 'package:todo_app/screens/incomplete_todos_screen.dart';
import 'package:todo_app/screens/todos_screen.dart';

Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, NavigateToScreenAction>(navigateToScreen),
]);

NavState navigateToScreen(NavState state, NavigateToScreenAction action) {
  Widget currentScreen = state.currentScreen;
  String currentScreenTitle = state.currentScreenTitle;

  if (action.index == 0) {
    currentScreen = TodosScreen();
    currentScreenTitle = todoScreenTitle;
  } else if (action.index == 1) {
    currentScreen = CompleteTodosScreen();
    currentScreenTitle = completeTodoScreenTitle;
  } else if (action.index == 2) {
    currentScreen = IncompleteTodosScreen();
    currentScreenTitle = incompleteScreenTitle;
  }

  return state.copyWith(
    currentIndex: action.index,
    currentScreen: currentScreen,
    currentScreenTitle: currentScreenTitle
  );
}