import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/services/DeleteOrderService.dart';
import 'package:pharmacist_app/services/GetShowOrder1.dart';
import 'package:pharmacist_app/views/OldOrderDetailsView.dart';

//public
List<OrderCategoryModel> dataController =
    []; //to store all data from api and take the length of it to make controller
double? totalPriceOrderDetails = 0;

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrder1().getShowOrder(
            token:
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA'),
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
                    length: data.length,
                    child: TabBarView(
                      children: List.generate(
                        data.length,
                        (index) => ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              //orderDetails price
                              totalPriceOrderDetails = data[index].price;
                              return GestureDetector(
                                onTap: () {
                                  Get.to(OldOrderDetailsView(
                                      // index: index,obj: data[index],
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
                                                '${index+1}',
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
                                                    padding: EdgeInsets.only(
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
                                                  setState(() {
                                                    if (data[index]
                                                            .orderStatus ==
                                                        'in_preparation') {
                                                      DeleteOrderService()
                                                          .deleteOrder(
                                                        orderId: data[index].id,
                                                        token:
                                                            'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA',
                                                      );
                                                    }
                                                  });
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
}

double? total_price;
