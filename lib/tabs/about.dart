import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => new AboutState();
}

// SingleTickerProviderStateMixin is used for animation
class AboutState extends State<About> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("About Tab")
          ],
        ),
      ),
    );
  }
}