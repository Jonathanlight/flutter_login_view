import 'package:flutter/material.dart';
import 'package:flutter_login_tab/tabs/login.dart';
import 'package:flutter_login_tab/tabs/register.dart';
import 'package:flutter_login_tab/tabs/about.dart';
import 'package:flutter_login_tab/view/drawer.dart';

void main() {
  runApp(new MaterialApp(
    title: "Home",
    debugShowCheckedModeBanner: false,
    home: new MyHome(),
    routes: {
        '/drawerPage': (context) => DrawerPage(),
        '/home': (context) => MyHome(),
      },
    ),
  );
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int i = 0;
  var pages = [
    new Login(),
    new Register(),
    new About()
  ];

  void _onItemTapped(int index) {
   setState(() {
     i = index;
   });
  }

  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  onButtonRoute(String route) {
    Navigator.pushReplacementNamed(context, '/'+route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Home"),
          backgroundColor: Colors.blue,
        ),
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        fixedColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Login")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person_add),
              title: new Text("Register")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              title: new Text("Favorite")
          )
        ],
      ),
      // code removed for brevity
    );
  }
}