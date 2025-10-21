import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('login integration test successfully', () {
    testWidgets('test login successfully', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final emailField = find.byKey(const ValueKey("emailField"));
      await tester.enterText(emailField, 'eve.holt@reqres.in');

      final passField = find.byKey(const ValueKey("passwordField"));
      await tester.enterText(passField, 'cityslicka');

      Finder loginBtn = find.byKey(const ValueKey('loginButton'));
      await tester.tap(loginBtn);

      await tester.pumpAndSettle();

      expect(find.textContaining('Login Successfully'), findsOneWidget);
    });

    testWidgets('test login Failed', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final emailField = find.byKey(const ValueKey("emailField"));
      await tester.enterText(emailField, 'eve.holt@reqres');

      final passField = find.byKey(const ValueKey("passwordField"));
      await tester.enterText(passField, 'cityslick');

      Finder loginBtn = find.byKey(const ValueKey('loginButton'));
      await tester.tap(loginBtn);

      await tester.pumpAndSettle();

      expect(find.textContaining('user not found'), findsOneWidget);
    });
  });
}
