import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabit/components/my_drawer.dart';
import 'package:rabit/components/my_habit_tile.dart';
import 'package:rabit/database/rabit_database.dart';
import 'package:rabit/util/habit_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  late String todayDate;

  TextField habitTextField({String? hintText = ""}) {
    return TextField(
      controller: textController,
      autofocus: true,
      cursorColor: Theme.of(context).colorScheme.secondary,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2))),
    );
  }

  void createNewHabit() {
    textController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: habitTextField(hintText: "Name"),
        actions: [
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              textController.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              final String habitName = textController.text;
              Provider.of<RabitDatabase>(context, listen: false)
                  .addHabit(habitName);
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void checkHabitOnOff(int id, bool? check) {
    if (check == null) return;
    Provider.of<RabitDatabase>(context, listen: false)
        .updateHabitCompletion(id, check);
  }

  void editHabit(int id, String name) {
    textController.text = name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: habitTextField(),
        actions: [
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              final String habitName = textController.text;
              Provider.of<RabitDatabase>(context, listen: false)
                  .updateHabitName(id, habitName);
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void deleteHabit(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            "Are you sure want to delete?",
          ),
        ),
        actions: [
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Provider.of<RabitDatabase>(context, listen: false)
                  .deleteHabit(id);
              Navigator.of(context).pop();
            },
            child: const Text("Yes"),
          ),
          MaterialButton(
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("No"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Provider.of<RabitDatabase>(context, listen: false).readHabits();
    todayDate = formatTodayDate();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          todayDate,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
              size: 28,
            ),
          ),
          const SizedBox(width: 20)
        ],
        backgroundColor: Colors.transparent,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: createNewHabit,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: _buildHabitList(),
    );
  }

  Widget _buildHabitList() {
    final habitList = Provider.of<RabitDatabase>(context).currentHabits;

    return ListView.builder(
      itemCount: habitList.length,
      itemBuilder: (context, index) {
        final habit = habitList[index];
        bool isCompletedToday = isHabitCompletedToday(habit.completedDays);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: MyHabitTile(
            onChanged: (value) => checkHabitOnOff(habit.id, value),
            habitId: habit.id,
            habitName: habit.name,
            isCompleted: isCompletedToday,
            editHabit: (BuildContext context) =>
                editHabit(habit.id, habit.name),
            deleteHabit: (BuildContext context) => deleteHabit(habit.id),
          ),
        );
      },
    );
  }
}
