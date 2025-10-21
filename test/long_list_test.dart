import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/widget_test_folder/long_items_page.dart';

void main() {
  testWidgets("finds a deep item in a long list", (WidgetTester tester) async {
    final List<String> itemsList = List<String>.generate(
      10000,
      (item) => 'item $item',
    );

    await tester.pumpWidget(LongItemsPage(items: itemsList));

    // here there is one scrollable widget only
    Finder scrollableWidget = find.byType(Scrollable);

    Finder itemFinder = find.text('item 500');

    //scroll amount/height in every time
    //it determine axis direction depending on direction of scrollable widget
    // not that if scrollable not assigned it determine the first scrollable widget
    // the scroll has number of scrolling times after end it throw exception not found

    Size size = tester.getSize(scrollableWidget);

    await tester.scrollUntilVisible(
      itemFinder,
      size.height, //amount of scroll per one
      scrollable: scrollableWidget, //determine scrollable widget
      maxScrolls:
          100, //determine number of scrolls if the finder not found throw these 100 scrolls it throws exception and not complete to the end of the list
    );

    expect(itemFinder, findsOneWidget);
  });
}
