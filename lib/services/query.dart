import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Query extends StatefulWidget {
  @override
  QueryState createState() => new QueryState();
}

// SingleTickerProviderStateMixin is used for animation
class QueryState extends State<Query> {

  @override
  void initState() {
    super.initState();
  }

  static String urlPath = 'https://cryptizy.com/api/';

  static Future<List> _postLogin(String endpoint, Object data) async {
    final response = await http.post(urlPath + endpoint, body: data);

    var dataUser = json.decode(response.body);

    return dataUser;
  }

  @override
  Widget build(BuildContext context) {}
}