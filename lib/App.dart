import 'package:flutter/material.dart';
import 'CountrySelector.dart';
import 'GameScreen.dart';
import 'Inheriteds/John.dart';
import 'backend/SoccerSimulator.dart';
import 'main.dart';

class MyApp extends StatefulWidget {
  @override
  createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Login(
        onSuccess: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext ctx) => MainApp()));
        },
      ),
    );
  }
}

class MainApp extends StatefulWidget {

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List teams = [
    Team(name: "Albanie", code: "alb", strength: 1),
    Team(name: "Nederland", code: "nld", strength: 15),
    Team(name: "Australie", code: "aus", strength: 5),
    Team(name: "Duitsland", code: "deu", strength: 20),
    Team(name: "USA", code: "usa", strength: 10)
  ];
  Team team1;
  Team team2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    team1 = team2 = teams[0];
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
                    home: Scaffold(
                      body: Container(
                        color: Colors.green,
                        child: Column(
                          children: [
                            Expanded(
                                child: CountrySelector(
                              teams: teams,
                              onCountrySelected: (country) {
                                setState(() {
                                  team1 = country;
                                });
                              },
                            )),
                            Container(
                                height: 50,
                                child: (team1 == null || team2 == null)
                                    ? Container()
                                    : ElevatedButton(
                                        child: Text("start game"),
                                        onPressed: () async {
                                          bool cont =
                                              await Navigator.of(context).push(
                                            MaterialPageRoute<bool>(
                                                builder: (BuildContext ctx) {
                                              return Material(
                                                child: Container(
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text("Are you sure?"),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true);
                                                            },
                                                            child: Text("YES")),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false);
                                                            },
                                                            child: Text("NO")),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                          if (cont) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext _) =>
                                                        Material(
                                                            child: GameScreen(
                                                                team1: team1,
                                                                team2:
                                                                    team2))));
                                          }
                                        },
                                      )),
                            Container(
                              child: (team1 == null || team2 == null)
                                  ? Text("Selecteer twee landen")
                                  : Container(
                                      padding: EdgeInsets.all(30),
                                      child: Text(
                                          "${team1?.name} vs ${team2?.name}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 30,
                                          ))),
                            ),
                            Expanded(
                                child: CountrySelector(
                              teams: teams,
                              onCountrySelected: (country) {
                                setState(() {
                                  team2 = country;
                                });
                              },
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}