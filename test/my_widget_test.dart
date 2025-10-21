import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/widget_test_folder/screen_to_test.dart';

void main() {
  testWidgets("my widget has a title and message", (WidgetTester tester) async {
    //to simulate widget in tester
    await tester.pumpWidget(const MyWidgets(title: "t", message: "m"));

    //top level method
    Finder titleFind = find.text("t");
    Finder messageFind = find.text("m");

    expect(titleFind, findsOneWidget);
    expect(messageFind, findsOneWidget);
  });

  testWidgets("find widget by key", (WidgetTester tester) async {
    //to simulate widget in tester
    await tester.pumpWidget(const MyWidgets(title: "m", message: "m"));

    Finder appBarFind = find.byKey(Key("AppBar"));

    expect(appBarFind, findsOneWidget);
  });

  testWidgets("find widget by type", (WidgetTester tester) async {
    //to simulate widget in tester
    await tester.pumpWidget(const MyWidgets(title: "m", message: "m"));

    Finder typeFind = find.byType(Center);

    expect(typeFind, findsOneWidget);
  });

  testWidgets("find widget by instance", (WidgetTester tester) async {
    Widget icon = const Icon(Icons.abc);
    //check on instance not value
    await tester.pumpWidget(MyWidgets(title: "m", message: "m", icon: icon));

    Finder iconFind = find.byWidget(icon);

    expect(iconFind, findsOneWidget);
  });

  testWidgets("find appBar with title", (WidgetTester tester) async {
    //to simulate widget in tester
    await tester.pumpWidget(const MyWidgets(title: "t", message: "m"));

    Finder appBarFind = find.byKey(Key('AppBar'));

    expect(appBarFind, findsOneWidget);

    Finder appBarAsTitle = find.descendant(
      of: appBarFind,
      matching: find.text("t"),
    );

    expect(appBarAsTitle, findsOneWidget);
  });
}
