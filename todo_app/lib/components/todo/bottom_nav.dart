import 'package:flutter/material.dart';
import 'package:todo_app/model/app_state.dart';

// Redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/redux/nav/nav_actions.dart';
import 'package:todo_app/redux/nav/selectors.dart';



class BottomNav extends StatelessWidget {

  BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return BottomNavigationBar(
          currentIndex: viewModel.selectedBottomNav,
          onTap: viewModel.onBottomNavSelected,
          items: _getItems(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_rounded),
        title: Text('All'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_turned_in_rounded),
        title: Text('Complete'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_late_rounded),
        title: Text('Incomplete'),
      ),
    ];
  }
}

class _ViewModel {
  final int selectedBottomNav;
  final Function(int) onBottomNavSelected;

  _ViewModel({
    @required this.selectedBottomNav,
    @required this.onBottomNavSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedBottomNav: currentIndexSelector(store.state),
      onBottomNavSelected: (index) => store.dispatch(NavigateToScreenAction(index: index)),
    );
  }
}