import 'package:flutter/material.dart';
import 'package:todo_app/theme/styles.dart';
import 'package:todo_app/utils/format.dart';

// Components
import 'package:todo_app/components/common/text.dart';

// Models
import 'package:todo_app/model/todo_item.dart';

class TodoCard extends StatelessWidget {
  final TodoItem todoItem;
  final Function onChangedCheckBox;

  TodoCard({@required this.todoItem, @required this.onChangedCheckBox});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                key: Key('checkbox_todo_card_${todoItem.id}'),
                  value: this.todoItem.isCompleted == true,
                  onChanged: (value) {
                    this.onChangedCheckBox(this.todoItem.id);
                  }),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: this.todoItem.name,
                      textStyle: TextStyles.descriptionTodoStyles,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      child: MyText(
                        text: MyFormat.formatDateTimeToYMDHMSString(
                            this.todoItem.createdAt),
                        textStyle: TextStyles.createdTodoDateStyles,
                      ),
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
