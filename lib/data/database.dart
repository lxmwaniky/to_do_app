import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final _toDoBox = Hive.box('toDoBox');
  List toDoitems = [];


}