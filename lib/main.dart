import 'package:flutter/material.dart';
import 'package:monitor_app/widget/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitor App',
      theme: ThemeData(
        backgroundColor: Colors.blue,
        primarySwatch: Colors.blue,
        primaryColorLight: Colors.blue

      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: MyHomePage(title: 'Monitor App'),
      )
    );
  }
}

