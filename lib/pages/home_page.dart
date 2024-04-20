import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/todo_tile.dart';
import 'package:to_do_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoBox = Hive.box('toDoBox');
  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_toDoBox.get('TODOITEMS') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxState(bool? value, int index) {
    setState(() {
      db.toDoitems[index][1] = !db.toDoitems[index][1];
    });
    db.upDateDB();
  }

  void saveTask() {
    setState(() {
      db.toDoitems.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upDateDB();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: (() => Navigator.of(context).pop()),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoitems.removeAt(index);
    });
    db.upDateDB();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To Do App'),
          backgroundColor: Colors.amberAccent,
        ),
        body: ListView.builder(
          itemCount: db.toDoitems.length,
          itemBuilder: ((context, index) {
            return ToDoTile(
              taskName: db.toDoitems[index][0],
              isDone: db.toDoitems[index][1],
              onChanged: (value) => checkBoxState(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: addNewTask, child: const Icon(Icons.add)),
      ),
    );
  }
}
