import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final String icon;
  final String header;
  final String detail;

  EventDetail({this.icon, this.header, this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          width: 50,
          height: 50,
          child: this.icon != "" ? Image.asset("assets/images/" + this.icon) : Container()),
      Expanded(
          child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("$header"), Text("$detail")],
              )))
    ]));
  }
}
