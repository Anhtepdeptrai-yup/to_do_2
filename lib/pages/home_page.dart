import 'package:flutter/material.dart';
import 'package:to_do_2/data/database.dart';
import 'package:to_do_2/utility/todo_util.dart';
import 'package:to_do_2/utility/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

//stateless
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  //ref the box
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    //1st time open => create initial data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else {
      db.loadData();
    }

    super.initState();
  }


  // checkboxchange == checkbox was clicked
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoTasks[index][1] = !db.todoTasks[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.todoTasks.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
    db.updateDatabase();
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        }
    );
  }

  //deletetask
  void deleteTask(int index){
    setState(() {
      db.todoTasks.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdeb887),

        appBar: AppBar(
          title: Text(
            'TO DO LIST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF273746),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal.shade200 ,
        ),

        body: ListView.builder(
            itemCount: db.todoTasks.length,
            itemBuilder: (context, index) {
              return TodoUtil(
                taskName: db.todoTasks[index][0],
                taskCompleted: db.todoTasks[index][1],
                onChanged: (value) => checkBoxChange(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }

        ),

        floatingActionButton: FloatingActionButton(
          onPressed:() {
            createNewTask();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.teal.shade100,
          shape: CircleBorder(),
        )
    );
  }
}