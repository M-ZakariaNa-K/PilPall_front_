import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/controller/basketController.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/Orders/PostAddOrderService.dart';
import 'package:pharmacist_app/views/categories-page.dart';

import 'package:pharmacist_app/widgets/basket_item_lists.dart';
import 'package:pharmacist_app/widgets/showDialog.dart';

// ignore: must_be_immutable
class BasketPage extends StatefulWidget {
  BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isPlaceOrderClicked = false;

  final BasketItemsList objList = BasketItemsList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDCEFFD),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          backgroundColor: const Color(0xff88BFDD),
          title: Text("currentOrder".tr),
        ),
        body: basketItems.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomScrollView(
                  slivers: [
                    const BasketItemsList(),
                    const SliverToBoxAdapter(
                      child: Divider(
                        thickness: 3,
                        color: Color(0xff013a71),
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                    //Total Price
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("totalPrice".tr,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Open Sans',
                                    //fontFamily: 'Montserrat',
                                    color: Color(0xff003A71),
                                  )),
                              GetBuilder(
                                  init: BasketController(),
                                  builder: (controller) {
                                    return
                                        // Text('${controller.sum1} SYP',
                                        Text('$sum1 SYP',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Open Sans',
                                              color: Color(0xff003A71),
                                              fontWeight: FontWeight.bold,
                                            ));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:
                          //TO LET PHARMACIEST GO TO DRUGS PAGE WIITHOUT going out to last pages
                          //the next button will make him go to CategoriesPage()
                          Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(CategoriesPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "addMore".tr + "  \+",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  color: Color(0xff003A71),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 10),
                            alignment: Alignment.center,
                            width: 150,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xff003A71),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 4),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: GetBuilder(
                                init: BasketController(),
                                builder: (controller) {
                                  return GestureDetector(
                                    onTap: () async {
                                      PostAddOrderService().postAddOrderService(
                                        str:strVar,
                                        token: tokenVar!,
                                      );
                                      //clear the Public list

                                      // Show the dialog
                                      showDialogConfirmOrder(context:context,text:"Are you sure you want to place the order?");
                                      setState(() {
                                        basketItems.clear();
                                        basketItemsPlaceOrderList1.clear();
                                        print(basketItemsPlaceOrderList1);
                                      });
                                    },
                                    child: Text(
                                      "placeOrder".tr,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Open Sans',
                                        color: Color(0xffDCEFFD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  basketItems.clear();
                                  basketItemsPlaceOrderList1.clear();
                                });
                              },
                              child: Text(
                                "deleteOrder".tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            //if there is no order
            : CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        "noOrder".tr,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xff003A71),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
