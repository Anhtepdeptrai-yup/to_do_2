import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoTasks = [

  ];

  //ref the box
  final _myBox = Hive.box('mybox');

  // run 1st time open app
  void createInitialData() {
    todoTasks = [
      ['Do laundry', false],
      ['Buy groceries', false],
    ];
  }

  // load data from database
  void loadData() {
    todoTasks = _myBox.get("TODOLIST");
  }

  //update
  void updateDatabase() {
    _myBox.put("TODOLIST", todoTasks);
  }

}