import 'package:flutter/material.dart';

import 'EventDetail.dart';
import 'backend/SoccerSimulator.dart';

class GameDetailRow extends StatelessWidget {
  final Map datarow;
  final Team teama;
  final Team teamb;
  GameDetailRow({this.datarow, this.teama, this.teamb});

  String enumToString(Object o) => o.toString().split('.').last;

  String getIcon(SoccerEvent event) {
    switch (event) {
      case SoccerEvent.RedCard:
        return "redcard.png";
      case SoccerEvent.YellowCard:
        return "yellowcard.png";
      case SoccerEvent.Goal:
        return "goal.png";
      default:
        return "";
    }
  }

  String getDescription(SoccerEvent event) {
    return enumToString(event);
  }

  @override
  Widget build(BuildContext context) {
    var gameminute = datarow["gametime"];
    Team t = datarow["team"];
    var gameeventLeft = "";
    var gameeventLeftDetail = "";
    var gameeventRight = "";
    var gameeventRightDetail = "";
    var icon = getIcon(datarow["event"]);
    var event = getDescription(datarow["event"]);
    var detail = "player ${datarow["player"]}";
    if (t == teama) {
      gameeventLeft = event;
      gameeventLeftDetail = detail;
    } else {
      gameeventRight = event;
      gameeventRightDetail = detail;
    }

    return Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: EventDetail(
                        icon: gameeventLeft == ""
                            ? ""
                            : icon,
                        header: gameeventLeft,
                        detail: gameeventLeftDetail))),
            Stack(children: [
              Positioned.fill(
                  child: FractionallySizedBox(
                      widthFactor: 0.02,
                      child: Container(color: Colors.black))),
              Container(
                  alignment: Alignment.center,
                  width: 45,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Center(
                      child:
                          Text("$gameminute", style: TextStyle(fontSize: 16)))),
            ]),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: EventDetail(
                  icon: gameeventRight == "" ? "" : icon,
                  header: gameeventRight,
                  detail: gameeventRightDetail),
            ))
          ],
        ));
  }
}
