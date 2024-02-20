import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/main.dart';

class MyLocaleController extends GetxController {
  // Locale initialLang = sharepref!.getString("lang") == "ar"?const Locale("ar"): const Locale("en");
  //here app will have the Device Language as defult language then when chane it, the app will store this lang in cashe
  Locale initialLang = sharepref!.getString("lang") == null
      ? Get.deviceLocale!
      : Locale(sharepref!.getString("lang")!);
  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    sharepref!.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
