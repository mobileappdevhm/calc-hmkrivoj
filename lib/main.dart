import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final _display = const TextStyle(fontSize: 48.0);
  final _buttonLeft = const TextStyle(fontSize: 32.0, color: Colors.white);
  final _buttonRight = const TextStyle(fontSize: 24.0, color: Colors.white);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Calculator',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
            body: new Column(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text('7353', style: _display,)
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
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('7', style: _buttonLeft,)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('8', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('9', style: _buttonLeft)),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                              new Row(
                                children: <Widget>[
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('4', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('5', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('6', style: _buttonLeft)),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                              new Row(
                                children: <Widget>[
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('1', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('2', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('3', style: _buttonLeft)),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                              new Row(
                                children: <Widget>[
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('.', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('0', style: _buttonLeft)),
                                  new FlatButton(
                                      padding: new EdgeInsets.all(32.0),
                                      onPressed: null,
                                      child: new Text('=', style: _buttonLeft)),
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
                            new FlatButton(
                                padding: new EdgeInsets.all(32.0),
                                onPressed: null,
                                child: new Text('CE', style: _buttonRight)),
                            new FlatButton(
                                padding: new EdgeInsets.all(32.0),
                                onPressed: null,
                                child: new Text('/', style: _buttonRight)),
                            new FlatButton(
                                padding: new EdgeInsets.all(32.0),
                                onPressed: null,
                                child: new Text('*', style: _buttonRight)),
                            new FlatButton(
                                padding: new EdgeInsets.all(32.0),
                                onPressed: null,
                                child: new Text('-', style: _buttonRight)),
                            new FlatButton(
                                padding: new EdgeInsets.all(32.0),
                                onPressed: null,
                                child: new Text('+', style: _buttonRight)),
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
            )
        )
    );
  }
}
