import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  final bool autoFocus;
  final String hintText;
  final String labelText;
  final int maxLength;
  final void Function(String value) onChange;
  TextInput({Key key, this.autoFocus = false, this.hintText = '', this.labelText = '', this.onChange, this.maxLength = 256}) : super(key: key);

  @override
  TextInputState createState() => TextInputState();
}

class TextInputState extends State<TextInput> {

  void onChangeText(String text) {
    widget.onChange(text);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          onChanged: (text) => {
            onChangeText(text)
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
          ],
          autofocus: widget.autoFocus,
          autocorrect: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: widget.hintText,
              labelText: widget.labelText

          ),
        )
    );
  }

}