import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/network/dio_helper.dart';
import 'package:pharmacist_app/helper/api_calls.dart';

class LoginController extends GetxController {
  late TextEditingController passcontroller;
  late TextEditingController phcontroller;
  late GlobalKey<FormState> loginKey;

  void login() {
    if (!(loginKey.currentState!.validate())) return;
    ApiCalls().ZOZO(phone: phcontroller.text, password: passcontroller.text);
  }

  @override
  void onInit() {
    passcontroller = TextEditingController();
    phcontroller = TextEditingController();
    loginKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    phcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }
}
