import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class Login{
  Future<bool> login({
    @required BuildContext? context,
    @required String? message,
    @required String? message1,
    required String phone,
    required String password,
  }) async {
     
     

     
   Map<String, dynamic> data= await api().post(
      message1:message1,
      message: message,
      context: context,
      url: '$projectUrlVar/api/login',
      body: {
        'phone': phone,
        'password': password,
        'device_token':deviceToken,
      },
    );
   
    // data['data']['token']
    try {

    if (tokenVar == null) {
    box.write('token', data['data']['token']);
    tokenVar =box.read('token');
    return true;
  } else {
    return false;
  }

} on Exception catch (e) {
  print("zzzz");
  return false;
}
    // box.remove('token');
  }
}
