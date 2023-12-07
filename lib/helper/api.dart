import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  //GET
  Future<dynamic> get({required String url, required String? token}) async {
    //if (http://127.0.0.1:8000) not work use (http://10.0.2.2:8000)
    http.Response response = await http.get(
      Uri.parse(url),
      headers: token != null
          ? {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            }
          : {'Content-Type': 'application/json'},
    );

    var data = json.decode(response.body);
    //dyn amic data= json.decode(response.body);
    // return response.body;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

//Post
  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    print('zzzzzzz:' + response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
    //to return the message in API just write : <<<<<jsonDecode(response.body)>>>> in exception
  }

  //Delete
  delete({required var url1, required String token, required int orderId}) async {
    var url = Uri.parse(url1);
    var response =
        await http.delete(url, headers: {'Authorization': 'Barer $token'});
    if (response.statusCode == 200) {
      print('Order deleted successfully');
    } else {
      print('Failed to delete order. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
    //i call it in onPressed the Cansel button
  }
}

//                 TO Save TOOKEN
// _save(String token) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = token;
//   prefs.setString(key, value);
// }

// read() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final key = 'token';
//   final value = prefs.get(key) ?? 0;
//   print('read : $value');
// }

// Future<bool> setToken(String value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.setString('token', value);
// }

// Future<String?> getToken() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('token');
// }
