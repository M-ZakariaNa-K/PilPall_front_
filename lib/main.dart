import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/util/Binding.dart';
import 'package:pharmacist_app/views/basket.dart';
import 'package:pharmacist_app/views/homePage.dart';
import 'package:pharmacist_app/views/order_page.dart';

void main() {
 
    WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: const HomePage(),
      initialBinding: MyBinding(),
      getPages: [
        GetPage(name: '/orderPage', page: () => const OrderPage()),
        GetPage(name: '/basketPage', page: () => BasketPage()),
      ],
    );
  }
}

