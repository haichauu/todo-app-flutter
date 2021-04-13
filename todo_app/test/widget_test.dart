// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/components/todo/todo_card.dart';
import 'package:todo_app/model/todo_item.dart';

import 'package:todo_app/utils/format.dart';

void main() {
  testWidgets(
      'Todo card has description string, created at string, checkbox widget',
      (WidgetTester tester) async {
    TodoItem todoItem =
        new TodoItem(name: 'Test widget', createdAt: DateTime.now());

    await tester.pumpWidget(Directionality(
      child: TodoCard(
        todoItem: todoItem,
        onChangedCheckBox: () {},
      ),
      textDirection: TextDirection.ltr,
    ));

    final descriptionFinder = find.text(todoItem.name);
    final createdAtStringFinder =
        find.text(MyFormat.formatDateTimeToYMDHMSString(todoItem.createdAt));
    expect(descriptionFinder, findsOneWidget);
    expect(createdAtStringFinder, findsOneWidget);

    final checkboxKey =  Key('checkbox_todo_card_${todoItem.id}');
    expect(find.byKey(checkboxKey), findsOneWidget);

  });
}
