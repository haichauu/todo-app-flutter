import 'package:flutter/material.dart';
import 'package:todo_app/theme/styles.dart';
import 'package:todo_app/utils/format.dart';

// Components
import 'package:todo_app/components/common/text.dart';

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
          return Card(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: todos[index].isCompleted == true,
                        onChanged: (value) {
                          _viewModel.onUpdateStatusTodoItem(todos[index].id);
                        }),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: todos[index].name,
                            textStyle: TextStyles.descriptionTodoStyles,
                            textAlign: TextAlign.start,
                          ),
                          Container(
                            child: MyText(
                              text: MyFormat.formatDateTimeToYMDHMSString(
                                  todos[index].createdAt),
                              textStyle: TextStyles.createdTodoDateStyles,
                            ),
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
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
