import 'package:intl/intl.dart';
import 'package:rabit/models/habits_log.dart';

bool checkSameDate(DateTime date1, DateTime date2) => (date1.day == date2.day &&
    date1.month == date2.month &&
    date1.year == date2.year);

String formatTodayDate() => DateFormat.MMMd().format(DateTime.now());

Map<DateTime, int> buildHeatMapDataset(List<HabitsLog> habitsLogs) {
  final Map<DateTime, int> dataset = {};
  for (HabitsLog habitsLog in habitsLogs) {
    final date =
        DateTime(habitsLog.date.year, habitsLog.date.month, habitsLog.date.day);
    if (habitsLog.totalHabits == 0) {
      dataset[date] = 0;
    } else {
      dataset[date] =
          ((habitsLog.completedHabits / habitsLog.totalHabits) * 5).ceil();
    }
  }
  return dataset;
}
