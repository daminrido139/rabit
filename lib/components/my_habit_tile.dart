import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHabitTile extends StatelessWidget {
  final String habitName;
  final bool isCompleted;
  final void Function(bool?)? onChanged;
  final int habitId;
  final void Function(BuildContext)? editHabit;
  final void Function(BuildContext)? deleteHabit;

  const MyHabitTile({
    super.key,
    required this.onChanged,
    required this.habitName,
    required this.isCompleted,
    required this.habitId,
    this.editHabit,
    this.deleteHabit,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: editHabit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(10),
          ),
          SlidableAction(
              flex: 1,
              onPressed: deleteHabit,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10))
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (onChanged == null) return;
          onChanged!(!isCompleted);
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: ListTile(
            leading: Checkbox(
              onChanged: onChanged,
              value: isCompleted,
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              habitName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
