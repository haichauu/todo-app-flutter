import 'package:flutter/material.dart';
import 'package:todo_app/model/app_state.dart';

// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/redux/nav/selectors.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          child: viewModel.rootScreen,
        );
      },
    );
  }
}

class _ViewModel {
  final Widget rootScreen;

  _ViewModel({
    @required this.rootScreen,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      rootScreen: currentScreenSelector(store.state),
    );
  }
}