import 'package:flutter/material.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoitems = [
    ['Coding', false],
    ['Debugging', false],
    ['Testing', false],
    ['Deploying', false],
  ];

  void checkBoxState(bool? value, int index) {
    setState(() {
      toDoitems[index][1] = !toDoitems[index][1];
    });
  }

  void createTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return DialogBox();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: toDoitems.length,
        itemBuilder: ((context, index) {
          return ToDoTile(
            taskName: toDoitems[index][0],
            isDone: toDoitems[index][1],
            onChanged: (value) => checkBoxState(value, index),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
