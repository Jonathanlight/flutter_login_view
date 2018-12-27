import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_login_tab/services/query.dart';
import 'package:flutter_login_tab/view/drawer.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

// SingleTickerProviderStateMixin is used for animation
class LoginState extends State<Login> {

  @override
  void initState() {
    super.initState();
  }

  var email = new TextEditingController();
  var password = new TextEditingController();

  String error = '';
  String urlPath = 'https://cryptizy.com/api/';
  var dataPost;

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  testCallGet() {
    print(QueryService.getData('https://reqres.in/api/users?page=2'));
  }

  testCallPost() {
    print(QueryService.postData('connexion', {
      'email': email.text,
      'password': password.text,
    }));
  }

  Future time(int time) async {

    Completer c = new Completer();
    new Timer(new Duration(seconds: time), (){
      c.complete('done with time out');
      setState(() { error = ''; });
    });

    return c.future;
  }

  Future<List> _login() async {
    final response = await http.post(
      Uri.encodeFull(urlPath + 'connexion'), 
      headers: { "Accept": "application/json" },
      body: {
      'email': email.text,
      'password': password.text,
    });

    dataPost = json.decode(response.body);

    if(response.statusCode >= 200 && response.statusCode <= 210) {
      if (null != dataPost['id']) {
        setState(() { error = 'login good'; });
        print(dataPost['id']);
        time(3);
        //onButtonRouteReplace('/drawerPage');
        onButtonTapReplace(DrawerPage());
      } else {
        setState(() { error = 'login failed'; });
        time(3);
      }
    } else {
      setState(() { error = 'query failed'; });
      time(3);
    }
  }

  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page)
        );
  }

  onButtonTapReplace(Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => page)
        );
  }

  onButtonRoute(String route) {
    Navigator.pushNamed(
      context, route
      );
  }

  onButtonRouteReplace(String route) {
    Navigator.pushReplacementNamed(
      context, route,
      );
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double _width = width * 0.65;

    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.person,
              size: 160.0,
              color: Colors.red,
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                controller: email,
                autocorrect: true,
                textAlign: TextAlign.left,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username",
                  helperText: "Your username"
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                controller: password,
                obscureText: _obscureText,
                maxLength: 150,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  filled: true,
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: _toggle
                  ),
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal),
              ),
            ),
            new Container(
              width: _width,
              child: new RaisedButton(
                child: new Text(
                  'Login',
                  style: new TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () => _login(),
                color: Colors.blue,
              ),
              margin: new EdgeInsets.only(
                top: 20.0
              ),
            ),
            new Container(
              width: _width,
              child: new Text(
                error,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.red
                ),
              ),
              margin: new EdgeInsets.only(
                top: 20.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}