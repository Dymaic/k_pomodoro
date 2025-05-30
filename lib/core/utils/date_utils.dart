import 'package:intl/intl.dart';

/// A utility class for date and time operations
/// including formatting, parsing, and date calculations.
/// 
/// author: kmookay
/// date: 2023-10-01
class DateUtils {
  /// 格式化日期为字符串
  static String formatDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(date);
  }

  /// 格式化时间为字符串
  static String formatTime(DateTime time, {String pattern = 'HH:mm:ss'}) {
    return DateFormat(pattern).format(time);
  }

  /// 格式化日期时间为字符串
  static String formatDateTime(
    DateTime dateTime, {
    String pattern = 'yyyy-MM-dd HH:mm:ss',
  }) {
    return DateFormat(pattern).format(dateTime);
  }

  /// 解析字符串为日期时间
  static DateTime? parseDateTime(
    String dateString, {
    String pattern = 'yyyy-MM-dd HH:mm:ss',
  }) {
    try {
      return DateFormat(pattern).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// 获取今天的开始时间 (00:00:00)
  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// 获取今天的结束时间 (23:59:59)
  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// 判断两个日期是否是同一天
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// 判断是否是今天
  static bool isToday(DateTime date) {
    return isSameDay(date, DateTime.now());
  }

  /// 获取两个日期之间的天数差
  static int daysBetween(DateTime date1, DateTime date2) {
    return date2.difference(date1).inDays;
  }

  /// 添加天数
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// 添加小时
  static DateTime addHours(DateTime date, int hours) {
    return date.add(Duration(hours: hours));
  }

  /// 添加分钟
  static DateTime addMinutes(DateTime date, int minutes) {
    return date.add(Duration(minutes: minutes));
  }

  /// 获取本周的开始日期 (周一)
  static DateTime getStartOfWeek(DateTime date) {
    final startOfDay = getStartOfDay(date);
    return startOfDay.subtract(Duration(days: date.weekday - 1));
  }

  /// 获取本周的结束日期 (周日)
  static DateTime getEndOfWeek(DateTime date) {
    final startOfWeek = getStartOfWeek(date);
    return getEndOfDay(startOfWeek.add(const Duration(days: 6)));
  }

  /// 获取本月的开始日期
  static DateTime getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// 获取本月的结束日期
  static DateTime getEndOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59);
  }

  /// 格式化持续时间为可读字符串
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  /// 格式化分钟为时分格式
  static String formatMinutesToHourMinute(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}m';
  }
}
