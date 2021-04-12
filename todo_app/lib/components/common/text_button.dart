import 'package:flutter/material.dart';

// Components
import 'package:todo_app/components/common/text.dart';

// Redux
import 'package:redux/redux.dart';
import 'package:todo_app/redux/nav/selectors.dart';

// Models
import 'package:todo_app/model/app_state.dart';

// Styles
import 'package:todo_app/theme/styles.dart';

class MyTextButton extends StatelessWidget {
  final String btnTxt;
  final Function onPress;
  final ButtonStyle style;
  MyTextButton({Key key, @required this.btnTxt, this.onPress, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      style: this.style ?? ButtonStyles.commonButtonStyles,
      child:
          MyText(text: this.btnTxt, textStyle: TextStyles.addTaskBtnTxtStyles),
      onPressed: this.onPress,
    ));
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
