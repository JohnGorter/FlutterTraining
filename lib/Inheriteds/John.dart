import 'package:flutter/material.dart';

class John extends StatefulWidget {
  final Widget child;
  John({this.child});

  @override
  _JohnState createState() => _JohnState();
}

class _JohnState extends State<John> {
  Color color = Colors.red;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JohnInherited(state: this, child: widget.child);
  }

  changeColor(Color c) {
    setState(() {
      color = c;
    });
  }
}

class JohnInherited extends InheritedWidget {
  Color color;
  _JohnState state;

  JohnInherited({
    Key key,
    this.state,
    @required child,
  }) : super(key: key, child: child) {
    this.color = state.color;
  }

  static JohnInherited of(BuildContext context) {
    final JohnInherited result =
        context.dependOnInheritedWidgetOfExactType<JohnInherited>();
    return result;
  }

  @override
  bool updateShouldNotify(JohnInherited old) {
    return color != old.color;
  }
}
