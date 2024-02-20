import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/lang/localeController.dart';
import 'package:pharmacist_app/views/Pharmacy_App/HomeLayout.dart';
import 'package:pharmacist_app/views/Pharmacy_App/One_Page.dart';
import 'package:pharmacist_app/views/categories-page.dart';
import 'package:pharmacist_app/views/company_page.dart';
import 'package:pharmacist_app/views/favoritePage.dart';
import 'package:pharmacist_app/views/notifactionsView.dart';
import 'package:pharmacist_app/views/store_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.toNamed('/orderPage'); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.red,
              child: Text('order'.tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.to(StorePage()); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: Text('stores'.tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.to(CompanyPage()); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: Text('company'.tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.to(CategoriesPage()); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.green,
              child: Text('category'.tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(FavoritePage());
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: Text("favorite".tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.to(const NotifactionView()); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.red,
              child: Text('order'.tr),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const OrderPage());
              Get.to(
                const first(),
              ); // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const OrderPage();
              //     },
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.green,
              child: Text('order'.tr),
            ),
          ),
          MaterialButton(
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              controllerLang.changeLang("ar");
            },
            child: Text('arabic'.tr),
          ),
          MaterialButton(
            color: Colors.grey,
            textColor: Colors.white,
            onPressed: () {
              controllerLang.changeLang("en");
            },
            child: Text("english".tr),
          ),
        ],
      ),
    );
  }
}
