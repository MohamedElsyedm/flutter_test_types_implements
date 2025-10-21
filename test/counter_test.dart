import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/unit_test_folder/counter.dart';

void main() {
  group('Test counter start increment & decrement', () {
    Counter counter = Counter();

    test('value should start with 0', () {
      expect(counter.value, 0);
    });
    test('counter increment by 1 on clicked', () {
      counter.increment();
      expect(counter.value, 1);
    });
    test('counter decrement by 1 on clicked', () {
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}
