import 'package:flutter/material.dart';
import 'package:helloworld/backend/SoccerSimulator.dart';
import "Scoreboard.dart";
import 'dart:async';
import 'GameDetails.dart';

class GameScreen extends StatefulWidget {
  final Team team1;
  final Team team2;
 
  final double headerheight;
  GameScreen({this.headerheight = 200, this.team1, this.team2});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
 
  List<Map> data = [];
  int score1 = 0;
  int score2 = 0;
  int gameminute = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SoccerSimulator().start(
        speed: 100,
        teama: widget.team1,
        teamb: widget.team2,
        func: (state, event) {
          data.insert(0, event);
          if (event != null) {
           // if (event["event"] != null) data.insert(0, event);
            if (event["event"] == SoccerEvent.Goal) {
              // AssetsAudioPlayer.newPlayer().open(
              //     // Audio("assets/sounds/goal.mp3"),
              //     autoStart: true,
              //     showNotification: true,
              // );
              if (event["team"] == widget.team1) {
                setState(() {
                  score1++;
                });
              }
              if (event["team"] == widget.team2) {
                setState(() {
                  score2++;
                });
              }
            }
          }
          setState(() {
            gameminute = event["gametime"];
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.fitHeight, image:AssetImage("assets/images/field.jpeg"))),
            curve: Curves.easeInOut,
            height: 400,
            child: Scoreboard(
                gameminute: gameminute,
                teama: widget.team1.name,
                scorea: score1,
                teamb: widget.team2.name,
                scoreb: score2)),
        Expanded(
            flex: 2,
            child: GameDetails(data: data, teama: widget.team1, teamb: widget.team2)),
      ],
    );
  }
}
