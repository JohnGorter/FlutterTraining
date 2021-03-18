import 'package:flutter/material.dart';

class GameEndRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: TextButton(
      child: Text("Back to main"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    )));
  }
}
