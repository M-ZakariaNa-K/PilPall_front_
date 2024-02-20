import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/widgets/order_category.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
        
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        backgroundColor: const Color(0xff88BFDD),
        title: Text('appParOrder'.tr),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: OrderCategory(),
      ),
      //icon
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(const BasketPage());
          Get.toNamed('/basketPage');
        },
        backgroundColor: const Color(0xff88BFDD),
        tooltip: 'Go to Basket',
        child: const Icon(
          Icons.shopping_basket,
          color: Color(0xffDCEFFD),
        ),
      ),
    );
  }
}
