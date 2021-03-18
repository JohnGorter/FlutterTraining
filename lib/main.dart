import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'App.dart';
import 'dart:async';
import 'CountrySelector.dart';
import 'GameScreen.dart';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';

import 'Inheriteds/John.dart';

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
        routes: {
          "main": (BuildContext ctx) => Material(child: MyApp()),
        },
        initialRoute: "main",
        theme: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                subtitle1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                headline1:
                    TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
        ));
  }
}

main() {
  runApp(MaterialApp(home: Scaffold(body: MyApp())));
}

class JohnTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: MyText()));
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  String username = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        username = prefs.getString("username");
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          color: Colors.amber,
          child: Center(
              child: TextButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString("username", "niels gorter");
                    setState(() {username = "niels gorter";});
                  },
                  child: Text("Change user name")))),
      Container(color: Colors.amber, child: Center(child: Text("$username")))
    ]));
  }
}

class Login extends StatefulWidget {
  Function onSuccess;
  Login({this.onSuccess});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<int> digits = [];
  FocusNode digit1 = FocusNode();
  FocusNode digit2 = FocusNode();
  FocusNode digit3 = FocusNode();
  FocusNode digit4 = FocusNode();
  TextEditingController _digit1controller = TextEditingController();
  TextEditingController _digit2controller = TextEditingController();
  TextEditingController _digit3controller = TextEditingController();
  TextEditingController _digit4controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  showCursor: false,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: null,
                  autofocus: true,
                  focusNode: digit1,
                  controller: _digit1controller,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (v) {
                    digits = [];
                    digits.add(int.parse(v));
                    digit2.requestFocus();
                  },
                )),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 2, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  showCursor: false,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: null,
                  focusNode: digit2,
                  controller: _digit2controller,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (v) {
                    digits.add(int.parse(v));
                    digit3.requestFocus();
                  },
                )),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 2, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  showCursor: false,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: null,
                  focusNode: digit3,
                  controller: _digit3controller,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (v) {
                    digits.add(int.parse(v));
                    digit4.requestFocus();
                  },
                )),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 2, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  showCursor: false,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: null,
                  focusNode: digit4,
                  controller: _digit4controller,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (v) {
                    digits.add(int.parse(v));
                    if (digits[0] == 1 &&
                        digits[1] == 1 &&
                        digits[2] == 1 &&
                        digits[3] == 1) {
                      widget.onSuccess();
                    } else {
                      digits = [];
                      digit1.requestFocus();
                      _digit1controller.text = _digit2controller.text =
                          _digit3controller.text = _digit4controller.text = "";
                    }
                  },
                )),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 2, color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
