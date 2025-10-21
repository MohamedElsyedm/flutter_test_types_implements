import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/widget_test_folder/todo_list_with_dismiss_page.dart';

void main() {
  testWidgets('add and remove a todo from list cross dismiss', (
    WidgetTester tester,
  ) async {
    //add todo test
    await tester.pumpWidget(const TodoListPage());

    await tester.enterText(find.byType(TextField), "hi");

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();

    // hi0
    expect(find.text("hi"), findsOneWidget);
    expect(find.byKey(Key("hi0")), findsOneWidget);

    //remove todo test
    await tester.drag(find.byKey(Key("hi0")), Offset(500, 0));

    await tester.pumpAndSettle();

    expect(find.byKey(Key("hi0")), findsNothing);
  });
}
