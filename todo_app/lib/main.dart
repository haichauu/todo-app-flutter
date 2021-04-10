import 'package:flutter/material.dart';
import 'package:todo_app/components/common/app_bar.dart';
import 'package:todo_app/components/common/bottom_nav.dart';
import 'package:todo_app/redux/store.dart';
import 'package:todo_app/screens/root_screen.dart';
import 'package:todo_app/todo_app.dart';

void main() {
  final store = createStore();
  runApp(TodoApp(store: store));
}


