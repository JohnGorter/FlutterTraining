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
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(teama, style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold)),
                  Container(height: 20),
                  Text(
                    "$scorea",
                    style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text("-"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teamb,
                    style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 20),
                  Text(
                    "$scoreb",
                    style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )),
      Container(
        padding: EdgeInsets.only(top: 50),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${gameminute.toString().padLeft(2)}",
                style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      )
    ]);
  }
}
