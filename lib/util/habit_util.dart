import 'package:intl/intl.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  if (completedDays.isEmpty) return false;
  final today = DateTime.now();
  final int length = completedDays.length;
  if (completedDays[length - 1].day == today.day &&
      completedDays[length - 1].month == today.month &&
      completedDays[length - 1].year == today.year) return true;
  return false;
}

String formatTodayDate() => DateFormat.MMMd().format(DateTime.now());
