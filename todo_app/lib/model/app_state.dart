import 'package:todo_app/model/nav_state.dart';
import 'package:todo_app/model/todo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final TodoState todoState;
  final NavState navState;

  AppState({@required this.todoState, @required this.navState});

  factory AppState.initial() {
    return AppState(
        todoState: TodoState.initial(), navState: NavState.initial());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          todoState == other.todoState &&
          navState == other.navState;
  @override
  int get hashCode => todoState.hashCode ^ navState.hashCode;
}
