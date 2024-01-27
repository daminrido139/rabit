import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rabit/models/app_settings.dart';
import 'package:rabit/models/habit.dart';
import 'package:rabit/models/habits_log.dart';
import 'package:rabit/util/habit_util.dart';

class RabitDatabase extends ChangeNotifier {
  static late Isar isar;
  final List<Habit> currentHabits = [];
  final List<HabitsLog> currentHabitsLog = [];

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [AppSettingsSchema, HabitSchema, HabitsLogSchema],
      directory: dir.path,
    );
  }

  static Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()
        ..firstLaunchDate = DateTime.now()
        ..lastLaunchDate = DateTime(1970);
      await isar.writeTxn(() async => await isar.appSettings.put(settings));
    }
  }

  RabitDatabase() {
    updateAppSettings();
  }

  Future<void> updateAppSettings() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) return;
    if (!checkSameDate(existingSettings.lastLaunchDate, DateTime.now())) {
      existingSettings.lastLaunchDate = DateTime.now();
      await isar
          .writeTxn(() async => await isar.appSettings.put(existingSettings));
      await updateHabits();
      await addHabitsLog();
    }
    await readHabitsLogs();
    await readHabits();
  }

  Future<void> updateHabits() async {
    final fetchedHabits = await isar.habits.where().findAll();
    for (Habit habit in fetchedHabits) {
      habit.isCompleted = false;
      await isar.writeTxn(() async => await isar.habits.put(habit));
    }
  }

  Future<void> addHabitsLog() async {
    final newHabitsLog = HabitsLog()
      ..date = DateTime.now()
      ..totalHabits = await isar.habits.where().count();
    await isar.writeTxn(() async => await isar.habitsLogs.put(newHabitsLog));
  }

  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  Future<void> addHabit(String name) async {
    final todayHabitsLog = currentHabitsLog[currentHabitsLog.length - 1];
    todayHabitsLog.totalHabits++;
    final newHabit = Habit()..name = name;
    await isar.writeTxn(() async => await isar.habits.put(newHabit));
    await isar.writeTxn(() async => await isar.habitsLogs.put(todayHabitsLog));
    await readHabits();
    readHabitsLogs();
  }

  Future<void> readHabits() async {
    final fetchedHabits = await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners();
  }

  Future<void> readHabitsLogs() async {
    final fetchedHabitsLogs = await isar.habitsLogs.where().findAll();
    currentHabitsLog.clear();
    currentHabitsLog.addAll(fetchedHabitsLogs);
    notifyListeners();
  }

  Future<void> updateHabitCompletion(int id, bool check) async {
    final habit = await isar.habits.get(id);
    if (habit == null) return;
    habit.isCompleted = check;
    await isar.writeTxn(() async => await isar.habits.put(habit));
    final todayHabitsLog = currentHabitsLog[currentHabitsLog.length - 1];
    if (check) {
      todayHabitsLog.completedHabits++;
    } else {
      todayHabitsLog.completedHabits--;
    }

    await isar.writeTxn(() async => await isar.habitsLogs.put(todayHabitsLog));
    await readHabits();
    await readHabitsLogs();
  }

  Future<void> updateHabitName(int id, String name) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      habit.name = name;
      await isar.writeTxn(() async => await isar.habits.put(habit));
    }
    await readHabits();
  }

  Future<void> deleteHabit(int id) async {
    final todayHabitsLog = currentHabitsLog[currentHabitsLog.length - 1];
    final habit = await isar.habits.get(id);
    if (habit!.isCompleted) todayHabitsLog.completedHabits--;
    todayHabitsLog.totalHabits--;
    await isar.writeTxn(() async => await isar.habits.delete(id));
    await isar.writeTxn(() async => await isar.habitsLogs.put(todayHabitsLog));
    await readHabits();
    await readHabitsLogs();
  }
}
