import 'package:flutter/material.dart';

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
