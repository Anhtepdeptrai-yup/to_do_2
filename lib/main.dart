import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_2/pages/home_page.dart';
import 'package:to_do_2/pages/todo_page.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {

        }
    );
  }

}