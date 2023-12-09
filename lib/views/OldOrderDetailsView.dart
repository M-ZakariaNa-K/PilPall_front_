import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/OldOrderDetailsModel.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/controller/basketController.dart';
import 'package:pharmacist_app/widgets/OldOrderDetails.dart';
import 'package:pharmacist_app/widgets/order_category.dart';

class OldOrderDetailsView extends StatelessWidget {
  OldOrderDetailsView({
    super.key,
    required this.orderId1
  });
   int orderId1;
  // OrderCategoryModel obj;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDCEFFD),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          backgroundColor: const Color(0xff88BFDD),
          title: const Text('Current Order'),
        ),
        body: Column(
          children: [
            Expanded(child: OldOrderDetails(orderId: orderId1,)),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                width: 350,
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff88BFDD),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const  Text(
                          'Total price',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GetBuilder(
                            init: BasketController(),
                            builder: (controller) {
                              return Text(
                                //'${controller.sum1} SYR',
                                '${totalPriceOrderDetails}',
                                style:const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                ),
                              );
                            })
                      ],
                    ),
                  const  Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.price_change,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
