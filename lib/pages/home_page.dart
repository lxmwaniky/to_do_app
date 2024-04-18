import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('To Do App'), backgroundColor: Colors.yellow),
        body: ListView(
          children: [
            ToDoTile(
              taskName: 'Coding',
              taskCompleted: false,
            ),
            ToDoTile(
              taskName: 'Debugging',
              taskCompleted: true,
            )
          ],
        ));
  }
}
