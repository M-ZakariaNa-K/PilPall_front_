import 'package:flutter/material.dart';
import 'package:get/get.dart' as GET;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmacist_app/network/dio_helper.dart';

class ApiCalls {
  Future<Response> ZOZO(
      {required String phone, required String password}) async {
    Response response = await DioHelper.postData(url: 'login', data: {
      'phone': phone,
      'password': password,
      
    });
    if (response.statusCode == 200) {
      // final box = GetStorage();
      // box.write('token', );
      // print(box.read('token'));
      print('zizizi');
      GET.Get.snackbar(
        '',
        'absckbasjcb',
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      );
      // GET.Get.toNamed('/home');
    } else {
      print(response.data.toString());
      print('qqqqqq');
      GET.Get.snackbar(
        'title',
        'your email or password is not correct',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      );
    }
    return response;
  }
}
