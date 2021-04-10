import 'package:redux/redux.dart';
import 'package:todo_app/model/app_state.dart';
import 'package:todo_app/redux/reducer.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
  );
}
