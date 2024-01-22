import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabit/components/my_drawer.dart';
import 'package:rabit/components/my_list_tile.dart';
import 'package:rabit/database/rabit_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final String habitName = textController.text;
              Provider.of<RabitDatabase>(context, listen: false)
                  .addHabit(habitName);
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Create"),
          ),
          MaterialButton(
            onPressed: () {
              textController.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Provider.of<RabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        return MyListTile(habitName: habit.name);
      },
    );
  }
}
