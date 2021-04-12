import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/redux/nav/nav_reducer.dart';
import 'package:todo_app/redux/todo/todo_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    navState: navReducer(state.navState, action),
    todoState: todoReducer(state.todoState, action),
  );
}
