import 'package:flutter/material.dart';
import 'package:flutter_login_tab/main.dart';
import 'package:flutter_login_tab/view/home.dart';
import 'package:flutter_login_tab/view/profil.dart';



class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profil", Icons.person)
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerPageState();
  }
}

class DrawerPageState extends State<DrawerPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Home();
      case 1:
        return new Profil();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  onButtonRoute(String route) {
    Navigator.pushNamed(context, route);
  }

  onButtonRouteReplace(String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  logout() {
    Navigator.push(context, new MaterialPageRoute(
    builder: (context) =>
      new MyHome())
    );
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ),
      );
    }

    drawerOptions.add(
      new ListTile(
          leading: Icon(Icons.power_settings_new),
          title: new Text("Logout"),
          onTap: () { onButtonRouteReplace('/home'); }
        ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions,)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}