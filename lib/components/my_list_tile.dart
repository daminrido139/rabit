import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  final String habitName;
  const MyListTile({super.key, required this.habitName});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(widget.habitName),
      ),
    );
  }
}
