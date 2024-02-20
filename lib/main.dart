import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/firebase_options.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/lang/locale.dart';
import 'package:pharmacist_app/lang/localeController.dart';
import 'package:pharmacist_app/util/Binding.dart';
import 'package:pharmacist_app/views/Pharmacy_App/One_Page.dart';
import 'package:pharmacist_app/views/basket.dart';
import 'package:pharmacist_app/views/homePage.dart';
import 'package:pharmacist_app/views/order_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
    deviceToken = value;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const first(),
      // const HomePage(),
      initialBinding: MyBinding(),
      locale: controller.initialLang,
      translations: MyLocale(),
      getPages: [
        GetPage(name: '/orderPage', page: () => const OrderPage()),
        GetPage(name: '/basketPage', page: () => BasketPage()),
      ],
    );
  }
}
