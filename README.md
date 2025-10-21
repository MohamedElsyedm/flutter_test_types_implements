                          Flutter Testing
Testing types:

Unit test => test single function or class or method

Widget test => test a single widget 

Integration test => tests a complete app or a large part of an app

Why do we need testing ?

Ensure code quality 
Prevent future bugs
Facilitates maintenance and scalability

How do these tests differ ?

Unit test =>       scope (small, specific) =>     speed(fast) =>     purpose(ensure functions work correctly)

Widget test =>       scope(UI components) =>        speed (moderate)  =>        purpose(verify widget behaviour)

Integration tests  =>       scope(entire app)  =>        speed(slow)  =>       purpose(validate user workflows)

Unit test:
-	When u test specific function, method, or class u create file inside test folder called with (functionName_test.dart).
-	U should use test function to test value and write description of test in it 
-	test('counter increment by 1 on clicked', () {
-	    Counter counter = Counter();
-	
-	    counter.increment();
-	
-	    expect(counter.value, 1);
-	
-	  });

-	When there are more than one test related to each other we but it in group what called (grouping test)
 group('Test counter start increment & decrement', () {
    Counter counter = Counter();
    test('counter increment by 1 on clicked', () {
      counter.increment();
      expect(counter.value, 1);
    });
    test('counter decrement by 1 on clicked', () {
      counter.decrement();
      expect(counter.value, 0);
    });
  });
Moc dependencies (شئ غير حقيقى):
-	To test function contains api or any other dependency it take a lot of time, on the other hand u need to test function behaviour and output only
-	 not api 
-	A passing test might start failing if a web service or database returns unexpected results. 
This is known as a “flaky test”.
-	Mokito package is created by dart.dev is to test called  api class (control classes)
-	Mockito package depends on annotations

-	Steps to generate auto generated Mockito file:
o	After adding mockito  and build _runner packages and run pub get
o	Add annotation @GenerateMoks([List<classes>]) above main function inside test file
o	Then run ‘dart run build_runner watch’ command to generate file end with ‘.mock.dart’ 
o	This auto generated file contains class its name is like(MockClient) its location be inside test folder
o	U can use this fake auto generated class to represent needed arguments at (method/class) to be tested
-	 when() method:
o	Call a method on a mock object within the call to when, and call a canned response method on the result
o	Then Mockito will store the fake call to called method , and pair the exact arguments given with the response.
o	.thenAnswer() this method is to pass data to mock class object as its coming from API
o	Then calling need to test method or class and pass to it fake object with its data from when function
-	Then call expect(actual, matcher) to test the function accuracy 
-	But when testing above function the function return type not actual value so we should use type matcher which test the returned type not value.

-	From all above steps the tests be on the returned type only, so:
-	To test the entered type use .having(Object? Function(Album) feature, String description, dynamic matcher) this be at matcher argument and this method is to test the value and type(should be the same) of specific feature from the passed class.

-	setup(() {}):
o	this callback is called before every test
o	is to pass new object to mocClient at more than one test
o	this function called when there is sharing code between test functions
-	teardown(() {}):
o	unlike setup this callback is called after every test 








Widget test:
-	widgetTester is to build widget inside test environment 
-	testWidget instead of test function
-	finder is to search for widget inside test environment
-	matcher to check the widget
-	steps to test a widget:
o	first write testWidgets method (like test method) but it has WidgetTester type not callback 
o	then from this WidgetTester call pumpWidget and pass to its argument widget name
o	then use finder to find specific widget 
o	to find widget there are more than one way inside find (text, by key, by type, by instance, …)
o	to search inside specific widget not all tested scope use find.descendant(of: widget to search in, matching: anything to search on it).
o	Then write expect(actual, matcher) in matcher u number of widget to match or any matcher elss

-	Simulate user interaction:
o	Use await tester.tap(btn), this btn found by finder
o	Then simulate setState  using tester.pump() if not there any animation, but if there use tester.pumpAndSettle() 
o	Then find the new result 
o	And call expect()  to show the result
o	Not all this future functions need await to not throws error(new functions only).
-	Enter text:
o	First, find TextFormField  and button by Finder
o	Then, check the is it the true TextFormField and button by expect()
o	Then, enter text by use tester.enterText(finder base, text to be write)
o	And press button by tester.tap(finder)
o	Then, setstate by tester.pump() 
o	Then, find widget by the result text of the function
o	Then test by expect()
-	Find by scrollable :
o	pumpWidget
o	find scrollable widget 
o	find item at scrollable widget
o	call scrollUntilVisible():
	this function check the finder & amount of scroll & scrollable widget to search in & max scroll if needed(default value is 50 scroll)
	not that if the scrolls number met the max scroll and not found the finder value tester not complete the scrolling and return exception .
	u can get the size of the scrollable widget and pass its height of width due to scroll direction to get the max scroll every scroll.
	Note: this function determine the scroll direction depending on scrollable Widget passed if there, or first scrollable widget if not passed.

Integration test:

  - test be on virtual or real device 
  - tester can use real data instead mockito 
  - test all app
  - u can create test_utils to implement reusable functions 

