import 'package:flutter/material.dart';

// Models
import 'package:todo_app/model/app_state.dart';

// Redux
import 'package:todo_app/redux/nav/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HeaderBar extends StatelessWidget with PreferredSizeWidget {
  HeaderBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return AppBar(title: Text(viewModel.currentScreenTitle));
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ViewModel {
  final String currentScreenTitle;

  _ViewModel({
    @required this.currentScreenTitle,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      currentScreenTitle: currentScreenTitleSelector(store.state),
    );
  }
}
