import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => new AboutState();
}

// SingleTickerProviderStateMixin is used for animation
class AboutState extends State<About> {

  bool genre = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
      child: 
      (Platform.isIOS)
      ?
        new CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            backgroundColor: Colors.red,
            middle: new Text("home cupertino"),
          ),
          child: body(),
        )
      :
      new Scaffold(
          backgroundColor: Colors.white,
          body: body(),
        )
    );
  }

  Widget switchAccordingPlatform() {
    if (!Platform.isIOS) {
      return new CupertinoSwitch(
        value: true,
        activeColor: Colors.blue,
        onChanged: ((bool b) {
          genre = b;
        }),
      );
    } else {
      return new Switch(
        value: true,
        inactiveTrackColor: Colors.pink,
        activeTrackColor: Colors.blue,
        onChanged: ((bool b) {
          genre = b;
        }),
      );
    }
  }

  Widget body() {
      return new Stack(
        fit: StackFit.expand, 
        children: <Widget>[
            new Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  inputDecorationTheme: new InputDecorationTheme(
                    hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                    labelStyle:
                        new TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
              isMaterialAppTheme: true,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Form(
                      autovalidate: true,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new TextFormField(
                            style: TextStyle(color: Colors.red, ),
                            decoration: new InputDecoration(
                              labelText: "Enter Email", 
                              fillColor: Colors.red,
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                          ),
                          switchAccordingPlatform(),
                          new Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                          ),
                          new MaterialButton(
                            height: 50.0,
                            minWidth: 350.0,
                            color: Colors.blueAccent,
                            splashColor: Colors.blueGrey,
                            textColor: Colors.white,
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]);
    }

}