// 朋友圈的时间展示
String circleFriendsTimeAtParse(String timeStr) {
  DateTime timeAt = DateTime.parse(timeStr);
  return DateTime(
          timeAt.year, timeAt.month, timeAt.day, timeAt.hour, timeAt.minute)
      .describe(timeStr);
}

extension CircleFriendsDateTime on DateTime {
  String describe(String timeStr) {
    DateTime now = DateTime.now();
    Duration diff = difference(DateTime(now.year, now.month, now.day));
    String result = switch (diff) {
      Duration(inDays: -1) => '昨天',
      Duration(inDays: 0) => minute < 10 ? "$hour:0$minute" : "$hour:$minute",
      Duration(inDays: int d) => d < 0 ? '${d.abs()} 天前' : '',
    };
    return result;
  }
}
