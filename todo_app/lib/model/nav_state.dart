import 'package:flutter/material.dart';
import 'package:todo_app/constant/title_app_bar.dart';
import 'package:todo_app/screens/todos_screen.dart';

@immutable
class NavState {
  final int currentIndex;
  final Widget currentScreen;
  final String currentScreenTitle;

  NavState({
    @required this.currentIndex,
    @required this.currentScreen,
    @required this.currentScreenTitle
  });

  factory NavState.initial() {
    return NavState(
      currentIndex: 0,
      currentScreen: TodosScreen(),
      currentScreenTitle: todoScreenTitle
    );
  }

  NavState copyWith({
    int currentIndex,
    Widget currentScreen,
    String currentScreenTitle
  }) {
    return NavState(
      currentScreen: currentScreen ?? this.currentScreen,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreenTitle: currentScreenTitle ?? this.currentScreenTitle
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NavState &&
              runtimeType == other.runtimeType &&
              currentIndex == other.currentIndex &&
              currentScreen == other.currentScreen;

  @override
  int get hashCode => currentIndex.hashCode ^ currentScreen.hashCode;
}
