import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final snackBar = SnackBar(content: Text("Snackbar"));
  var colors = [
    Colors.teal,
    Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.pink,
    Colors.amber,
    Colors.cyan,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.brown,
  ];
  var currentColor = Colors.white;
  var currentButtonColor = Colors.black;
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const onSec = const Duration(seconds: 2);
    _timer = Timer.periodic(
        onSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                _start = 10;
                startTimer();
              } else {
                _start = _start - 1;
                changeColor(_start);
              }
            }));
  }

  int index;
  Color colorRightNow;
  void changeColor(int _start) {
    setState(() {
      currentColor = colors[_start];
    });
  }

  void changeBackground() {
    int random = Random().nextInt(colors.length);
    int randomButtonColor = Random().nextInt(colors.length);
    setState(() {
      currentColor = colors[random];
      currentButtonColor = colors[randomButtonColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Background-Changer App"),
        ),
        body: Container(
          color: currentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  RaisedButton(
                    color: currentButtonColor,
                    child: Text(
                      "Change color",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      40,
                      20,
                      40,
                      20,
                    ),
                    onPressed: changeBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: currentButtonColor,
                    child: Text(
                      "Auto Change color after 2 sec",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      40,
                      20,
                      40,
                      20,
                    ),
                    onPressed: () {
                      startTimer();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
