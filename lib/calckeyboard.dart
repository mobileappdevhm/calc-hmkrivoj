import 'package:flutter/material.dart';

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

  final VoidCallback _onPressed;
  final String _label;
  final TextStyle _style;

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

abstract class CalcKeyboardListener {
  void append(String s);
  void remove();
  void reset();
  void eval();
}
