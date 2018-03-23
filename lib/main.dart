import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator> implements CalcKeyboardListener {

  var _input = '0';
  var _preview = '0';

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new CalcDisplay(_input, _preview),
      new CalcKeyboard(this)
    ],);
  }

  @override
  void append(String s) {
    print('$s pressed');
    setState(() {
      if (_input == '0' && s != '.') {
        _input = s;
      } else {
        _input += s;
      }
      _updatePreview();
    });
  }

  @override
  void eval() {
    setState(() {
      _input = _preview;
      if (_input == 'Infinity') _input = '0';
      _updatePreview();
    });
  }

  @override
  void remove() {
    setState(() {
      if (_input.length <= 1) _input = '0';
      else _input = _input.substring(0, _input.length - 1);
      _updatePreview();
    });
  }

  @override
  void reset() {
    setState(() {
      _input = '0';
      _updatePreview();
    });
  }

  void _updatePreview() {
    Parser parser = new Parser();
    try {
      num result = parser.parse(_input).evaluate(EvaluationType.REAL, null);
      _preview = result.toString();
    } catch (exception) {
      // Do nothing
    }
  }
}

class CalcDisplay extends StatelessWidget {

  final TextStyle _big = new TextStyle(fontSize: 64.0);
  final TextStyle _small = new TextStyle(fontSize: 32.0);

  final String _input;
  final String _preview;

  CalcDisplay(this._input, this._preview);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(top: 16.0),
      child: new Column(children: <Widget>[
        new Align(child: new SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Text(_input, style: _big,),
        ), alignment: Alignment.centerRight,),
        new Align(alignment: Alignment.centerRight,
          child: new Text(_preview, style: _small,),)
      ],),
    );
  }
}

abstract class CalcKeyboardListener {
  void append(String s);
  void remove();
  void reset();
  void eval();
}

class CalcKeyboard extends StatelessWidget {

  final TextStyle _left = new TextStyle(color: Colors.white, fontSize: 32.0);
  final TextStyle _right = new TextStyle(color: Colors.white, fontSize: 24.0);

  final CalcKeyboardListener _listener;

  CalcKeyboard(this._listener);

  @override
  Widget build(BuildContext context) {
    return new Expanded(child: new Material(
      color: Colors.black87,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              children: <Widget>[
                new Row(children: <Widget>[
                  new CalcButton(() {_listener.append('7');}, _left, '7'),
                  new CalcButton(() {_listener.append('8');}, _left, '8'),
                  new CalcButton(() {_listener.append('9');}, _left, '9')
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                new Row(children: <Widget>[
                  new CalcButton(() {_listener.append('4');}, _left, '4'),
                  new CalcButton(() {_listener.append('5');}, _left, '5'),
                  new CalcButton(() {_listener.append('6');}, _left, '6')
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                new Row(children: <Widget>[
                  new CalcButton(() {_listener.append('1');}, _left, '1'),
                  new CalcButton(() {_listener.append('2');}, _left, '2'),
                  new CalcButton(() {_listener.append('3');}, _left, '3')
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                new Row(children: <Widget>[
                  new CalcButton(() {_listener.append('.');}, _left, '.'),
                  new CalcButton(() {_listener.append('0');}, _left, '0'),
                  new CalcButton(() {_listener.eval();}, _left, '=')
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          new Material(
            child: new Column(
              children: <Widget>[
                new GestureDetector(
                  child: new CalcButton(() {_listener.remove();}, _right, 'CE'),
                  onLongPress: () => _listener.reset(),
                ),
                new CalcButton(() {_listener.append('/');}, _right, '/'),
                new CalcButton(() {_listener.append('*');}, _right, '*'),
                new CalcButton(() {_listener.append('-');}, _right, '-'),
                new CalcButton(() {_listener.append('+');}, _right, '+'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            color: Colors.redAccent,
          ),
        ],
      ),
    ));
  }
}

class CalcButton extends StatelessWidget {

  final _onPressed;
  final _label;
  final _style;

  CalcButton(this._onPressed, this._style, this._label);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
      onPressed: _onPressed,
      child: new Text(_label, style: _style,),
    );
  }
}