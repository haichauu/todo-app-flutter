import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle commonTextStyles = TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', color: Colors.black, fontSize: 14);
  static const TextStyle createdTodoDateStyles = TextStyle(fontWeight: FontWeight.w300, color: Colors.grey, fontSize: 12);
  static const TextStyle descriptionTodoStyles = TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14);
  static const TextStyle addTaskBtnTxtStyles = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);

}

class ButtonStyles {
  static ButtonStyle commonButtonStyles = TextButton.styleFrom(backgroundColor: Colors.green);
}