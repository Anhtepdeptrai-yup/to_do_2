import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  TextEditingController _myController = TextEditingController();
  String greetingMessage = '';


  void greetUser(){
    String userName = _myController.text;
    setState(() {
      greetingMessage = "Welcome to the party, ${userName}!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(

            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                //Text
                Text(greetingMessage, style: TextStyle(fontSize: 20),),

                //textfield
                TextField(
                  controller: _myController,
                  decoration : InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    // reduce opacity of hint text
                    hintStyle: TextStyle(color: Colors.grey[400]),

                  ),
                ),

                //tap button
                ElevatedButton(
                  onPressed: greetUser,
                  child: Text('Tap me'),
                )
              ],
            ),
          ),
        )
    );
  }
}