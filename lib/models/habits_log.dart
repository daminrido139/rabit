import 'package:isar/isar.dart';

part 'habits_log.g.dart';

@Collection()
class HabitsLog {
  Id id = Isar.autoIncrement;
  late DateTime date;
  int totalHabits = 0;
  int completedHabits = 0;
}
