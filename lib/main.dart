import 'package:flutter/material.dart';
import 'screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Payments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 39, 86, 226), 
       
      ),
      home: Screen1(),
    );
  }
}
