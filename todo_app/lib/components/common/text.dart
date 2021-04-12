import 'package:flutter/material.dart';
import 'package:todo_app/theme/styles.dart';

class MyText extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  MyText({Key key, @required this.text, this.textStyle = TextStyles.commonTextStyles, this.textAlign = TextAlign.center}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text, textAlign: this.textAlign, overflow: TextOverflow.clip, style: this.textStyle)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
