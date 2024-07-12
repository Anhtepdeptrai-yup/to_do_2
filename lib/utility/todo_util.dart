import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_2/pages/home_page.dart';
import 'package:to_do_2/pages/todo_page.dart';

class TodoUtil extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  TodoUtil({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),

      child: Slidable(

        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              //Check Box
              Checkbox(
                value: taskCompleted, onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              //Task Name
              Text(
                  taskName,
                  // increase font size
        
                  style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough : null,
                    fontSize: 16,
                  )
              ),
        
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
        
        ),
      ),
    );
  }

}