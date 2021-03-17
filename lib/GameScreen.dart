import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/backend/SoccerSimulator.dart';
import "Scoreboard.dart";
import 'dart:async';
import 'GameDetails.dart';

class GameScreen extends StatefulWidget {
  final double headerheight;
  GameScreen({this.headerheight});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Team team1 = Team(name: "Holland", strength: 10);
  Team team2 = Team(name: "Brasil", strength: 15);
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
        teama: team1,
        teamb: team2,
        func: (state, event) {
          if (event != null) {
            if (event["event"] != null) data.insert(0,event);
            if (event["event"] == SoccerEvent.Goal) {
              AssetsAudioPlayer.newPlayer().open(
                  Audio("assets/sounds/goal.mp3"),
                  autoStart: true,
                  showNotification: true,
              );
              if (event["team"] == team1) {
                setState(() {
                  score1++;
                });
              }
              if (event["team"] == team2) {
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
            curve: Curves.easeInOut,
            height: widget.headerheight,
            color: Colors.blueGrey,
            child: Scoreboard(
                gameminute: gameminute,
                teama: team1.name,
                scorea: score1,
                teamb: team2.name,
                scoreb: score2)),
        Expanded(flex: 2, child: GameDetails(data:data, teama:team1, teamb:team2)),
      ],
    );
  }
}
