import 'package:flutter/material.dart';
import 'package:todo_app/components/todo/todo_card.dart';

// Models
import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/model/todo_item.dart';

// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todos;

  TodoList({this.todos});

  ListView buildListView(_ViewModel _viewModel) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoCard(todoItem: todos[index], onChangedCheckBox: _viewModel.onUpdateStatusTodoItem);
        });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          child: buildListView(viewModel),
          padding: EdgeInsets.symmetric(vertical: 10),
        );
      },
    );
  }
}

class _ViewModel {
  final Function(int) onUpdateStatusTodoItem;

  _ViewModel({
    @required this.onUpdateStatusTodoItem,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onUpdateStatusTodoItem: (id) =>
          store.dispatch(UpdateStatusTodoItemAction(id: id)),
    );
  }
}
