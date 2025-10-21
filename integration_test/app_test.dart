import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/integration_folder/home_screen.dart';
import 'package:flutter_test_types_implements/integration_folder/product_details_screen.dart';
import 'package:flutter_test_types_implements/main.dart';
import 'package:integration_test/integration_test.dart';

import 'test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests end to end', () {
    testWidgets('Successful Login', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await login(tester, 'cityslicka', 'eve.holt@reqres.in');

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Add New Product', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await login(tester, 'cityslicka', 'eve.holt@reqres.in');

      await tester.tap(find.byKey(ValueKey('MainAddProductBTN')));

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const ValueKey('ProductNameField')),
        'test producttt',
      );

      await tester.tap(find.byKey(const ValueKey('dialogAddProductBTN')));

      await tester.pumpAndSettle();

      expect(find.text('test producttt'), findsOneWidget);
    });

    testWidgets('Navigate to Product Details', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await login(tester, 'cityslicka', 'eve.holt@reqres.in');

      await tester.tap(find.byKey(ValueKey('Product 1')));

      await tester.pumpAndSettle();

      expect(find.byType(ProductDetails), findsOneWidget);
    });
  });
}
