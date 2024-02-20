import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/widgets/showDialog.dart';
import 'package:flutter/material.dart';

class api {
  Future<dynamic> get({required String url, @required int? Str}) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Str': "${strVar}",
      // '$strVar',
      'App-Local': '$langVar',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${box.read('token')}',
      'Authorization': 'Bearer $tokenVar'
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    @required BuildContext? context,
    @required String? message,
    @required String? message1,
    required String url,
    @required dynamic body,
    @required int? Str,
  }) async {
    dynamic box = GetStorage();
    Map<String, String> headrers = {};

    if (box.read('token') != null) {
      headrers.addAll({
        //'Authorization': 'Bearer ${box.read('token')}',
        'Authorization': 'Bearer $tokenVar',
        'Str': "$strVar",
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headrers,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 422) {
      // ignore: use_build_context_synchronously
      showDialog<String>(
        context: context!,
        builder: (BuildContext context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.jpg', width: 70, height: 70),
                Text(message!),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      );
      // {"user id": 0, "token": ''};
      // Future.value({'error':""});
    } else if (response.statusCode == 401) {
      showDialog<String>(
        context: context!,
        builder: (BuildContext context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.jpg', width: 70, height: 70),
                Text(message1!),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      );
      // return {"user id": 0, "token": ''};
      // Future.value({'error':""});;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
