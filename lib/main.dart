import 'package:flutter/material.dart';
import 'calculation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Calculator',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
            body: new Calculator()
        )
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => new CalculatorState();

}

class CalculatorState extends State<Calculator> {

  Calculation _calculation = new Calculation();

  final _display = const TextStyle(fontSize: 48.0);
  final _buttonLeft = const TextStyle(fontSize: 32.0, color: Colors.white);
  final _buttonRight = const TextStyle(fontSize: 24.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new Text(_calculation.calculation, style: _display,)
            ],
          ),
          padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 8.0),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new MyCustomButton('7', () {setState(() {_calculation.append(7);});}, _buttonLeft),
                          new MyCustomButton('8', null, _buttonLeft),
                          new MyCustomButton('9', null, _buttonLeft),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      new Row(
                        children: <Widget>[
                          new MyCustomButton('4', null, _buttonLeft),
                          new MyCustomButton('5', null, _buttonLeft),
                          new MyCustomButton('6', null, _buttonLeft),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      new Row(
                        children: <Widget>[
                          new MyCustomButton('1', null, _buttonLeft),
                          new MyCustomButton('2', null, _buttonLeft),
                          new MyCustomButton('3', null, _buttonLeft),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      new Row(
                        children: <Widget>[
                          new MyCustomButton('.', null, _buttonLeft),
                          new MyCustomButton('0', null, _buttonLeft),
                          new MyCustomButton('=', null, _buttonLeft),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new MyCustomButton('CE', _calculation.remove, _buttonRight),
                    new MyCustomButton('/', null, _buttonRight),
                    new MyCustomButton('*', null, _buttonRight),
                    new MyCustomButton('-', null, _buttonRight),
                    new MyCustomButton('+', null, _buttonRight)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                color: Colors.redAccent,
              )
            ],
          ),
          color: Colors.black87,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

}

class MyCustomButton extends StatelessWidget {

  final String _text;
  final _onPressed;
  final TextStyle _style;

  MyCustomButton(this._text, this._onPressed, this._style);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      padding: new EdgeInsets.all(32.0),
      onPressed: _onPressed,
      child: new Text(_text, style: _style));
  }

}