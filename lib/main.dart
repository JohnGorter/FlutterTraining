import 'package:flutter/material.dart';
import 'App.dart';
import 'dart:async';
import 'GameScreen.dart';
import 'dart:math' as math;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double headerheight = 250;
  double startheight = 250;
  double starty = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(headline1: TextStyle(fontSize: 40))),
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: GestureDetector(
              onVerticalDragStart: (details) {
                starty = details.globalPosition.dy;
                startheight = headerheight;
              },
              onVerticalDragUpdate: (details) {
                if (starty > 0)
                  headerheight = math.max(
                      250,
                      math.min(600,
                          startheight + (details.globalPosition.dy - starty)));

                setState(() {});
              },
              onVerticalDragEnd: (details) {
                // snap to closest
                if (headerheight > 400) {
                  headerheight = 600;
                } else {
                  headerheight = 250;
                }
                setState(() {});
                starty = 0;
              },
              child: GameScreen(headerheight: headerheight))),
    );
  }
}

main() {
  runApp(App());
}
