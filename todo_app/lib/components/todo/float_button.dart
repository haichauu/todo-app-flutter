import 'package:flutter/material.dart';

// Components
import 'package:todo_app/components/common/text_button.dart';
import 'package:todo_app/components/common/text_input.dart';

// Models
import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/model/todo_item.dart';

// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/redux/nav/selectors.dart';
import 'package:todo_app/redux/todo/todo_actions.dart';

class FloatButton extends StatefulWidget {
  @override
  FloatButtonState createState() => FloatButtonState();
}

class FloatButtonState extends State<FloatButton> {
  String taskDescription = '';

  onAddTask(BuildContext context, _ViewModel viewModel) {
    if (taskDescription != '') {
      TodoItem todoItem =
          new TodoItem(name: taskDescription, createdAt: DateTime.now());
      viewModel.onAddTodoItem(todoItem);
      setState(() {
        taskDescription = '';
      });
      Navigator.of(context).pop();
    }
  }

  void onChangeText(String text) {
    setState(() {
      taskDescription = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    TextInput(
                      autoFocus: true,
                      labelText: 'Enter a task',
                      onChange: this.onChangeText,
                    ),
                    MyTextButton(
                        btnTxt: 'Add',
                        onPress: () => onAddTask(context, viewModel))
                  ]),
                );
              },
            );
          },
          child: const Icon(Icons.add_rounded),
          backgroundColor: Colors.green,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ViewModel {
  final String currentScreenTitle;
  final Function(TodoItem) onAddTodoItem;

  _ViewModel({@required this.currentScreenTitle, @required this.onAddTodoItem});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      currentScreenTitle: currentScreenTitleSelector(store.state),
      onAddTodoItem: (item) =>
          store.dispatch(AddTodoItemAction(todoItem: item)),
    );
  }
}
