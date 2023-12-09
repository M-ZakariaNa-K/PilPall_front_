import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/services/DeleteOrderService.dart';
import 'package:pharmacist_app/services/GetShowOrder1.dart';
import 'package:pharmacist_app/views/OldOrderDetailsView.dart';

int confirmDeleteId = 0;
//public
List<OrderCategoryModel> dataController =
    []; //to store all data from api and take the length of it to make controller
double? totalPriceOrderDetails = 0;
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
            token:
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjAxNTJkN2ExYjZjZWYyOWM2MjZhMjhhYmU1ZWFkMjg3ODY5MjIwY2U4OWFlOTVlYmI3MDhiZWRmZDIwMmUxNWVmNTNlZjg5YmRlZDRjNTkiLCJpYXQiOjE3MDE5ODYyNzguNzk5NzY2LCJuYmYiOjE3MDE5ODYyNzguNzk5NzY5LCJleHAiOjE3MzM2MDg2NzguNzgyMjE3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.waB1tDS030LWB3piHSGqvI2rmqmFPRsFjR2xeBNGk5WdVWZtbzkNMyMCXmIS0wZmxO7jex7K3ooF26AVXs-j58A5zvnhnkifHXuayzmJpIql1RscOLaB0lfb-Qn3ZlMTirkDkz0vcpD-taaEPmcKS2pWElkQOpCqoULuCSAF_v6oTJRphGxgTbVl30H0lkGwe8-_HVYkeS-ePJU4Lupw4mim9PV_QB6R1neGE82LTLjU4dINr3yVDgjnf1NGCDQTe9NopBTjGM7y1TtGZa5aSChD2YUx4ixwuruEYEbE9jWOF0xzx8Sbo7TvIz4a9rtKKEvaZM_WNjbM98lkQB_dq2XHSyU-yNSJIsna7JHKYAW2FEskV3iKK1N224upPZfXT5tCgcoNOhqHhujj-h2tjBaDaO2-OxunDePW68Il447GAlsIiiP0xxHKphM0hBADxjrgdtG6aFrDmE8GSIMnK5g4-X-Z0HbUJy7U8sglDP9A2oHZJNywx9haPHCFleIXeew_xZNtnyECZdd-cGDSYDNkf2zO1eFPFU7LbHGdQL1xpDdFDyCgAlO7fZnSpWN0f8Zhs0OC6nijjRkZbpQKnfjFZqMMqOuMg56pDKmy6DqOFPN56g0tUH0DV3cCxUe67BjSu_gaO63r_sPRn6-YRHCDzeYuknfP2EedHN1-YKM'),
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
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Icon(
                                                      Icons.calendar_month,
                                                      size: 40,
                                                      color: Color(0xff013A71),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      'Date:',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            Color(0xff013A71),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 130,
                                                  ),
                                                  Text(
                                                    '${data[index].orderDate}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Open Sans',
                                                      color: Color(0xff013A71),
                                                    ),
                                                  ),
                                                ],
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
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, top: 10),
                                              height: 50,
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 40,
                                                    color: Color(0xff013A71),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Order Status',
                                                          style: TextStyle(
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
                                              left: 20, top: 10),
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
                                                      ? "Unpayed"
                                                      : 'Payed',
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
                                                  color:
                                                      '${data[index].orderStatus}' ==
                                                              'in_preparation'
                                                          ? Color(0xffF44438)
                                                          : Color(0xff686868),
                                                ),
                                              ),

                                              //Price
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Text(
                                                  '${data[index].price}',
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
                : const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'There is no orders yet',
                            style: TextStyle(
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

  //FUNCTION to conferm delete
  Future<void> showDeleteConfirmationDialog(
      BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            children: [
              Icon(
                Icons.warning_amber,
                color: Colors.red,
                size: 40,
              ), // Add your desired icon
              SizedBox(width: 8.0),
              Text('Delete Confirmation'),
            ],
          ),
          content: Text('Are you sure you want to delete item $id?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Color(0xffF44438)),
              ),
              onPressed: () {
                // Perform the delete operation
                setState(() {
                  DeleteOrderService().deleteOrder(
                    orderId: id,
                    token:
                        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjAxNTJkN2ExYjZjZWYyOWM2MjZhMjhhYmU1ZWFkMjg3ODY5MjIwY2U4OWFlOTVlYmI3MDhiZWRmZDIwMmUxNWVmNTNlZjg5YmRlZDRjNTkiLCJpYXQiOjE3MDE5ODYyNzguNzk5NzY2LCJuYmYiOjE3MDE5ODYyNzguNzk5NzY5LCJleHAiOjE3MzM2MDg2NzguNzgyMjE3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.waB1tDS030LWB3piHSGqvI2rmqmFPRsFjR2xeBNGk5WdVWZtbzkNMyMCXmIS0wZmxO7jex7K3ooF26AVXs-j58A5zvnhnkifHXuayzmJpIql1RscOLaB0lfb-Qn3ZlMTirkDkz0vcpD-taaEPmcKS2pWElkQOpCqoULuCSAF_v6oTJRphGxgTbVl30H0lkGwe8-_HVYkeS-ePJU4Lupw4mim9PV_QB6R1neGE82LTLjU4dINr3yVDgjnf1NGCDQTe9NopBTjGM7y1TtGZa5aSChD2YUx4ixwuruEYEbE9jWOF0xzx8Sbo7TvIz4a9rtKKEvaZM_WNjbM98lkQB_dq2XHSyU-yNSJIsna7JHKYAW2FEskV3iKK1N224upPZfXT5tCgcoNOhqHhujj-h2tjBaDaO2-OxunDePW68Il447GAlsIiiP0xxHKphM0hBADxjrgdtG6aFrDmE8GSIMnK5g4-X-Z0HbUJy7U8sglDP9A2oHZJNywx9haPHCFleIXeew_xZNtnyECZdd-cGDSYDNkf2zO1eFPFU7LbHGdQL1xpDdFDyCgAlO7fZnSpWN0f8Zhs0OC6nijjRkZbpQKnfjFZqMMqOuMg56pDKmy6DqOFPN56g0tUH0DV3cCxUe67BjSu_gaO63r_sPRn6-YRHCDzeYuknfP2EedHN1-YKM',
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



// Implement your delete logic here

