import 'package:flutter/material.dart';

import 'dart:async';

class Teller extends StatefulWidget {

  @override
  _TellerState createState() => _TellerState();
}

class _TellerState extends State<Teller> {
  int counter = 0;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter = counter + 1;
      print("counter hoog ik op...");
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Center(child: Text("teller: ${counter}")));
  }

  dispose() {
    print("i am dying...");
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Container(child: Teller())));
  }
}

main() {
  runApp(MyApp());
}
