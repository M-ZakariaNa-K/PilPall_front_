import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
    );
  }
}
