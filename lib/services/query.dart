import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class QueryService {
  /**
   * Post Method Query
   */
  static Future<Map<String, dynamic>> postData(String endpoint, Object data) async {
    // This might fail, use List<dynamic> if it does
    await new Future.delayed(new Duration(seconds: 1));
    final response = await http.post(
      Uri.encodeFull(endpoint), 
      headers: { "Accept": "application/json" },
      body: data
    );

    if(response.statusCode >= 200 && response.statusCode <= 210) {
      return json.decode(response.body);
    }
    
    return {'error': 'error server'};
  }

  /**
   * Put Method Query
   */
  static Future<Map<String, dynamic>> putData(String endpoint, Object data) async {
    // This might fail, use List<dynamic> if it does
    await new Future.delayed(new Duration(seconds: 1));
    final response = await http.post(
      Uri.encodeFull(endpoint), 
      headers: { "Accept": "application/json" },
      body: data
    );

    if(response.statusCode >= 200 && response.statusCode <= 210) {
      return json.decode(response.body);
    }
    
    return {'error': 'error server'};
  }

  /**
   * Get Method Query
   */
  static Future<Map<String, dynamic>> getData(String endpoint) async {
    await new Future.delayed(new Duration(seconds: 1));
    final response = await http.get(
      Uri.encodeFull(endpoint),
      headers: { "Accept": "application/json" }
    );

    if(response.statusCode >= 200 && response.statusCode <= 210) {
      return json.decode(response.body);
    }
    
    return {'error': 'error server'};
  }

  /**
   * Delete Method Query
   */
  static Future<Map<String, dynamic>> deleteData(String endpoint) async {
    await new Future.delayed(new Duration(seconds: 1));
    final response = await http.get(
      Uri.encodeFull(endpoint),
      headers: { "Accept": "application/json" }
    );

    if(response.statusCode >= 200 && response.statusCode <= 210) {
      return json.decode(response.body);
    }
    
    return {'error': 'error server'};
  }
}