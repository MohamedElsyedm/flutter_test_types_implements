import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_types_implements/unit_test_folder/util/time_helper.dart';

void main() {
  group("TimeHelper.getTimeOfDay test", () {
    test('TimeHelper should return morning', () {
      DateTime morningTime = DateTime(2025, 10, 19, 8);

      String time = TimeHelper.getTimeOfDay(dateTime: morningTime);

      expect(time, "morning");
    });

    test('TimeHelper should return night', () {
      DateTime nightTime = DateTime(2025, 10, 19, 4);

      String time = TimeHelper.getTimeOfDay(dateTime: nightTime);

      expect(time, "night");
    });
    test('TimeHelper should return afternoon', () {
      DateTime afternoonTime = DateTime(2025, 10, 19, 13);

      String time = TimeHelper.getTimeOfDay(dateTime: afternoonTime);

      expect(time, "afternoon");
    });
    test('TimeHelper should return evening', () {
      DateTime eveningTime = DateTime(2025, 10, 19, 20);

      String time = TimeHelper.getTimeOfDay(dateTime: eveningTime);

      expect(time, "evening");
    });
  });
}
