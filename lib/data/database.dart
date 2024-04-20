import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final _toDoBox = Hive.box('toDoBox');
  List toDoitems = [];

  void createInitialData() {
    toDoitems = [
      ['Leave a Star on the Github Repo', false],
      ['Delete these Tasks', false],
    ];
  }

  void loadData() {
    toDoitems = _toDoBox.get('TODOITEMS');
  }

  void upDateDB() {
    _toDoBox.put('TODOITEMS', toDoitems);
  }

}