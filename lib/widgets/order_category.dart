import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/Orders/DeleteOrderService.dart';
import 'package:pharmacist_app/services/Orders/GetShowOrder1.dart';
import 'package:pharmacist_app/views/OldOrderDetailsView.dart';

int confirmDeleteId = 0;
//public
List<OrderCategoryModel> dataController =
    []; //to store all data from api and take the length of it to make controller
num totalPriceOrderDetails = 0;
int idOrderDetails = 0;
//to store the list of model and know if it's empty to print('There is no order') on screen
int orderCategoryDataLength = 0;

//________________________________________________________________
class OrderCategory extends StatefulWidget {
  const OrderCategory({
    super.key,
  });

  @override
  State<OrderCategory> createState() => _OrderCategoryState();
}

class _OrderCategoryState extends State<OrderCategory> {
  double? total_price;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrder1().getShowOrder(
          lang: 'en',
          token: tokenVar!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            // print(temp);
            // data == showorderList in orderService
            List<OrderCategoryModel> data = temp;
            dataController = data;

            orderCategoryDataLength = data.length;
            return data.isNotEmpty
                ? DefaultTabController(
                    length: 1,
                    child: TabBarView(
                      children: List.generate(
                        1,
                        (index) => ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              //مشان مرر القيمة يلي بدي احذفها لابعت رسالة انو هل اكيد بدك تحذفها؟
                              confirmDeleteId = data[index].id;
                              //orderDetails price
                              totalPriceOrderDetails = data[index].price;

                              return GestureDetector(
                                onTap: () {
                                  Get.to(OldOrderDetailsView(
                                    // index: index,obj: data[index],
                                    orderId1: data[index].id,
                                  ));
                                },
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.only(right: 0),
                                    width: 360,
                                    height: 260,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffDCEFFD),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //1
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '${data[index].id}',
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xff013A71),
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              //Date
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0),
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        size: 40,
                                                        color:
                                                            Color(0xff013A71),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: Text(
                                                        'date'.tr,
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontFamily:
                                                              'Open Sans',
                                                          color:
                                                              Color(0xff013A71),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 120,
                                                    ),
                                                    Text(
                                                      '${data[index].orderDate}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            Color(0xff013A71),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        //2
                                        Divider(
                                          thickness: 1,
                                          color: const Color(0xff013a71)
                                              .withOpacity(.2),
                                          endIndent: 20,
                                          indent: 20,
                                        ),
                                        //3
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0),
                                                height: 50,
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        size: 40,
                                                        color:
                                                            Color(0xff013A71),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'orderStatus'.tr,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Color(
                                                                    0xff013A71),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${data[index].orderStatus}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Color(
                                                                    0xff013a71),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //4
                                        Divider(
                                          thickness: 1,
                                          color: const Color(0xff013a71)
                                              .withOpacity(.2),
                                          endIndent: 20,
                                          indent: 20,
                                        ),
                                        //5
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, top: 10, right: 10),
                                          height: 50,
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 100,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25)),
                                                  color: Color(0xff88BFDD),
                                                ),
                                                child: Text(
                                                  '${data[index].payedStatus}' ==
                                                          0
                                                      ? "unpayed".tr
                                                      : "payed".tr,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Open Sans',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              //delete order

                                              IconButton(
                                                onPressed: () {
                                                  if (data[index].orderStatus ==
                                                      'in_preparation') {
                                                    setState(() {
                                                      showDeleteConfirmationDialog(
                                                          context,
                                                          data[index].id);
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  size: 24,
                                                  Icons.delete,
                                                  color: data[index]
                                                              .orderStatus ==
                                                          'in_preparation'
                                                      ? const Color(0xffF44438)
                                                      : const Color(0xff686868),
                                                ),
                                              ),

                                              //Price
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0),
                                                child: Text(
                                                  '${data[index].price} S.P',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xff013a71),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  )
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
                  );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff88BFDD),
                ),
              ),
            );
          }
        });
  }

//=========================================================================SHOW Dialog=====================================================================
  //FUNCTION to conferm delete
  Future<void> showDeleteConfirmationDialog(
      BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Icon(
                Icons.warning_amber,
                color: Colors.red,
                size: 40,
              ),
              const SizedBox(width: 8.0),
              Text("deleteTitle".tr),
            ],
          ),
          content:
              Text("deleteConfirmation".tr + " $id " + "quistionLetter".tr),
          actions: <Widget>[
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text(
                "delete".tr,
                style: const TextStyle(color: Color(0xffF44438)),
              ),
              onPressed: () {
                setState(() {
                  DeleteOrderService().deleteOrder(
                    orderId: id,
                    token: tokenVar!,
                  );
                });

                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
