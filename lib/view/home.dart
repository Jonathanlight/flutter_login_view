import 'package:flutter/material.dart';
import 'package:flutter_login_tab/services/query.dart';

class Home extends StatefulWidget {

  String email;
  String name;
  int id;

  Home(this.id, this.email, this.name);

  @override
  HomeState createState() => new HomeState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeState extends State<Home> {

  String email = '';
  String name = '';
  int id;
  String reference = '';
  String telephone = '';

  String error = '';
  String urlPath = 'https://cryptizy.com/api/';
  var dataPost;

  @override
  void initState() {
    super.initState();

    id = widget.id;
    email = widget.email;
    name = widget.name;

    dataPost = QueryService.getData(urlPath + 'user/$id');

    dataPost.then((response) {
      reference = response['reference'];
      telephone = response['telephone'];
    });
    dataPost.catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Email: $email"),
            new Text("Nom: $name"),
            new Text("Réference: $reference"),
            new Text("Télephone: $telephone"),
          ],
        ),
      ),
    );
  }
}