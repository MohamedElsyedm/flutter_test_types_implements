import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future login(WidgetTester tester, String password, String email) async {
  await tester.enterText(find.byKey(const ValueKey('emailField')), email);

  await tester.enterText(find.byKey(const ValueKey('passwordField')), password);

  await tester.tap(find.byKey(const ValueKey('loginButton')));

  await tester.pumpAndSettle();
}
