import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/views/categories-page.dart';
import 'package:pharmacist_app/views/company_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: const Text('MY ORDER'),
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
              child: const Text('company'),
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
              child: const Text('category'),
            ),
          ),
        ],
      ),
    );
  }
}
