import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calcdisplay.dart';
import 'calckeyboard.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator>
    implements CalcKeyboardListener {
  var _input = '0';
  var _preview = '0';

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new CalcDisplay(_input, _preview),
        new CalcKeyboard(this)
      ],
    );
  }

  @override
  void append(String s) {
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
      if (_input.length <= 1)
        _input = '0';
      else
        _input = _input.substring(0, _input.length - 1);
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
