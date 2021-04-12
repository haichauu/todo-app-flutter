import 'package:flutter/material.dart';
import 'package:todo_app/components/todo/todo_list.dart';

// Redux
import 'package:redux/redux.dart';
import 'package:todo_app/redux/todo/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';

// Models
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/model/app_state.dart';

class IncompleteTodosScreen extends StatelessWidget {
  IncompleteTodosScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          child: TodoList(todos: viewModel.todoList),
        );
      },
    );
  }
}

class _ViewModel {
  final List<TodoItem> todoList;

  _ViewModel({
    @required this.todoList,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      todoList: incompleteTodoListSelector(store.state),
    );
  }
}
