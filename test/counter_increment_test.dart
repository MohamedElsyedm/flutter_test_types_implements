import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_types_implements/widget_test_folder/counter_increment.dart';

void main() {
  testWidgets("Counter increment press test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterIncrement()));

    Finder textFindZero = find.text("0");
    Finder btn = find.byType(ElevatedButton);

    expect(textFindZero, findsOneWidget);
    expect(btn, findsOneWidget);

    //press simulate
    await tester.tap(btn);

    //like set state
    // await tester.pump()

    // if there animation
    await tester.pumpAndSettle();

    //counter value increment when tap and pumpAndSettle
    Finder textFindOne = find.text("1");

    expect(textFindOne, findsOneWidget);
    expect(textFindZero, findsNothing);
  });

  // if there more than one textField u can find one of them by its hint text find.byText()

  testWidgets('calculate square & enter value & press btn', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CounterIncrement()));

    Finder textZeroFind = find.text("0");

    Finder btnByKey = find.byKey(Key('calculate_btn'));

    Finder numberField = find.byType(TextField);

    expect(textZeroFind, findsNWidgets(2));
    expect(numberField, findsOneWidget);
    expect(btnByKey, findsOneWidget);

    num number = 5;

    await tester.enterText(numberField, "$number");

    await tester.tap(btnByKey);

    await tester.pump();

    num result = number * number;

    Finder textSquared = find.text("$result");

    expect(textSquared, findsOneWidget);
    expect(textZeroFind, findsOneWidget);
  });
}
