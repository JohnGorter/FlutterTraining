import 'package:flutter/material.dart';
import 'GameEndRow.dart';
import 'GameDetailRow.dart';
import 'backend/SoccerSimulator.dart';

class GameDetails extends StatefulWidget {
  final List<Map> data;
  final Team teama;
  final Team teamb;

  GameDetails({this.data, this.teama, this.teamb});

  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  void didUpdateWidget(covariant GameDetails oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
   // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: ListView(
        controller: _scrollController,
        children: widget.data != null
            ? widget.data
                .map((Map datarow)  {
                  return datarow["gametime"] == 90 ? GameEndRow() : datarow["event"]  == null ? Container() : GameDetailRow(
                    datarow: datarow, teama: widget.teama, teamb: widget.teamb);
                }).toList()
            : [],
      ),
    );
  }
}
