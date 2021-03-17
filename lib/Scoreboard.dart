import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final String teama;
  final String teamb;
  final int scorea;
  final int scoreb;
  final int gameminute;

  Scoreboard(
      {this.teama = "",
      this.teamb = "",
      this.scorea = 0,
      this.scoreb = 0,
      this.gameminute = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teama,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(height: 20),
                  Text(
                    "$scorea",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              Text("-"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teamb,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(height: 20),
                  Text(
                    "$scoreb",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top:50),
            height:80,
            child:Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Game $gameminute")
            ],
          ),)
        ]);
  }
}
