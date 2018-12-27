import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class QueryService {
  static String urlPath = 'https://cryptizy.com/api/';

  ///
  /// @Desc: Post Method Query
  static Future<List> postData(String endpoint, Object data) async {
    await new Future.delayed(new Duration(seconds: 3));
    final response = await http.post(
      Uri.encodeFull(urlPath + endpoint), 
      headers: { "Accept": "application/json" },
      body: data
    );

    return jsonDecode(response.body);
  }

  ///
  /// @Desc: Put Method Query
  static Future<List> putData(String endpoint, Object data) async {
    await new Future.delayed(new Duration(seconds: 3));
    final response = await http.put(
      Uri.encodeFull(urlPath + endpoint), 
      headers: { "Accept": "application/json" },
      body: data
    );

    return jsonDecode(response.body);
  }

  ///
  /// @Desc: Get Method Query
  static Future<String> getData(String endpoint) async {
    await new Future.delayed(new Duration(seconds: 3));
    final response = await http.get(
      Uri.encodeFull(endpoint),
      headers: { "Accept": "application/json" }
    );

    return jsonDecode(response.body);
  } 

  ///
  /// @Desc: Delete Method Query
  static Future<List> deleteData(String endpoint) async {
    await new Future.delayed(new Duration(seconds: 3));
    final response = await http.delete(
      Uri.encodeFull(urlPath + endpoint), 
      headers: { "Accept": "application/json" }
    );

    return jsonDecode(response.body);
  }
}