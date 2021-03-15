import 'package:flutter/material.dart';
import 'CountrySelector.dart';

class MyApp extends StatefulWidget {
  @override
  createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String team1 = "Albanie";
  String team2 = "Albanie";

  @override
  Widget build(BuildContext context) {
    print("i am going to paint!");
    return MaterialApp(
        home: Scaffold(
            body: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Expanded(child: CountrySelector(
                      onCountrySelected: (country) {
                        print("$country");
                        setState(() {
                          team1 = country;
                        });
                      },
                    )),
                    Container(
                        height: 50,
                        child: ElevatedButton(
                          child: Text("start game"),
                          onPressed: () {
                            print("$team1 vs $team2");
                          },
                        )),
                    Container(
                      child: Text("$team1 vs $team2"),
                    ),
                    Expanded(child: CountrySelector(
                      onCountrySelected: (country) {
                        print("$country");
                        setState(() {
                          team2 = country;
                        });
                      },
                    )),
                  ],
                ))));
  }
}
