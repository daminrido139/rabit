import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rabit/models/app_settings.dart';
import 'package:rabit/models/habit.dart';

class RabitDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [AppSettingsSchema, HabitSchema],
      directory: dir.path,
    );
  }

  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  final List<Habit> currentHabits = [];

  Future<void> addHabit(String name) async {
    final newHabit = Habit()..name = name;
    await isar.writeTxn(() => isar.habits.put(newHabit));
    readHabits();
  }

  Future<void> readHabits() async {
    final fetchedHabits = await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners();
  }

  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      if (isCompleted) {
        habit.completedDays.add(DateTime.now());
      } else {
        habit.completedDays.removeLast();
      }
      await isar.writeTxn(() => isar.habits.put(habit));
      readHabits();
    }
  }

  Future<void> updateHabitName(int id, String name) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      habit.name = name;
      await isar.writeTxn(() => isar.habits.put(habit));
    }
    readHabits();
  }

  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() => isar.habits.delete(id));
    readHabits();
  }
}
