import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register> {

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
            new Icon(
              Icons.person_add,
              size: 160.0,
              color: Colors.red,
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.email),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: const Icon(Icons.label),
              title: const Text('Nick'),
              subtitle: const Text('None'),
            ),
            new ListTile(
              leading: const Icon(Icons.today),
              title: const Text('Birthday'),
              subtitle: const Text('February 20, 1980'),
            ),
            new ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Contact group'),
              subtitle: const Text('Not specified'),
            )
          ],
        ),
      ),
    );
  }
}