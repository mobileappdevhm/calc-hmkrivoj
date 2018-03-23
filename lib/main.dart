import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Calculator',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new Scaffold(
            body: new Calculator()
        )
    );
  }
}
