import 'package:flutter/material.dart';
// import 'package:hello/pages/classroom/game/game_page.dart';
import 'package:hello/pages/classroom/stateful_lesson_conditional_operator.dart';
import 'package:hello/pages/homework/homework5_forloopstar.dart';
import 'package:hello/pages/homework/homework6.dart';
import 'package:hello/pages/homework/homework6_teacher.dart';
import 'package:hello/pages/homework/homework7.dart';
import 'package:hello/pages/homework/homework9.dart';
import 'package:hello/pages/homework/midterm_test.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: GamePage(),
    );
  }
}
