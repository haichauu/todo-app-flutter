import 'package:flutter/material.dart';

// Components
import 'package:todo_app/components/common/text.dart';

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
}