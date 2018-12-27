import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  ProfilState createState() => new ProfilState();
}

// SingleTickerProviderStateMixin is used for animation
class ProfilState extends State<Profil> {

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
            new Text("Profil Tab")
          ],
        ),
      ),
    );
  }
}