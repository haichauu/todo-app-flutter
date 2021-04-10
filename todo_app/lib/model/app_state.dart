import 'package:todo_app/model/nav_state.dart';
import 'package:todo_app/model/todo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final TodoState totoState;
  final NavState navState;

  AppState({@required this.totoState, @required this.navState});

  factory AppState.initial() {
    return AppState(
        totoState: TodoState.initial(), navState: NavState.initial());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          totoState == other.totoState &&
          navState == other.navState;
  @override
  int get hashCode => totoState.hashCode ^ navState.hashCode;
}
