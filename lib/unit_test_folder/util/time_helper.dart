class TimeHelper {
  static String getTimeOfDay({DateTime? dateTime}) {
    String value = "evening";

    DateTime time = dateTime ?? DateTime.now();
    value = time.hour >= 0 && time.hour < 6
        ? "night"
        : time.hour >= 6 && time.hour < 12
        ? "morning"
        : time.hour >= 12 && time.hour < 18
        ? "afternoon"
        : "evening";

    return value;
  }
}
