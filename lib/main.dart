import 'package:flutter/material.dart';
import 'package:ttt/check.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.amber,
          backgroundColor: Colors.black54,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepOrange[300].withOpacity(0.7),
            shadowColor: Colors.amberAccent,
            centerTitle: true,
          ),
          textTheme: TextTheme(
              titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ))),
      home: HomePage(),
    );
  }
}
