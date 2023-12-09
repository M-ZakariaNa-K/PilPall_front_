import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/controller/basketController.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/services/DeleteOrderService.dart';
import 'package:pharmacist_app/services/PostAddOrderService.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/views/order_page.dart';
import 'package:pharmacist_app/widgets/basket_item.dart';
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
  Widget build(BuildContext context) {
    return
        // FutureBuilder(future: PostAddOrderService().postAddOrderService(
        //   medicine_id: 18,
        //   quantity: 3,
        //   token:'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA'

        // ), builder:(context, snapshot) {
        //  if (snapshot.hasData) {
        // dynamic temp = snapshot.data;
        // print('im teeeeeemp: '+temp);
        // List<OrderCategoryModel> data = temp;
        Scaffold(
            backgroundColor: const Color(0xffDCEFFD),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
              backgroundColor: const Color(0xff88BFDD),
              title: const Text('Current Order'),
            ),
            body: items.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomScrollView(
                      slivers: [
                        BasketItemsList(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Price',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Open Sans',
                                        //fontFamily: 'Montserrat',
                                        color: Color(0xff003A71),
                                      )),
                                  GetBuilder(
                                      init: BasketController(),
                                      builder: (controller) {
                                        return Text('${controller.sum1} SYP',
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
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        //Get.to(CategoriesPage());
                                      },
                                      child: const Text(
                                        'Add more',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Open Sans',
                                          color: Color(0xff003A71),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        //Get.to(CategoriesPage());
                                      },
                                      icon: const Icon(
                                        size: 20,
                                        Icons.add,
                                        color: Color(0xff003A71),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // FutureBuilder(
                              //   future: PostAddOrderService().postAddOrderService(

                              //       token:
                              //           'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA'),
                              //           builder: (context, snapshot) {
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 0, bottom: 10),
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
                                      print(
                                          controller.basketItemsPlaceOrderList);
                                      return GestureDetector(
                                        onTap: () async {
                                          // PostAddOrderService()
                                          //     .postAddOrderService(
                                          //   token: '',
                                          //   body: {
                                          //     List.generate(controller.basketItemsPlaceOrderList.length, (index){
                                          //       return {
                                          //         "medicine_id":controller.basketItemsPlaceOrderList[index]['medicine_id'],
                                          //         'quantity':controller.basketItemsPlaceOrderList[index]['quantity'],
                                          //       };
                                          //     })
                                          //   },
                                          //   url: '',
                                          // );
                                          // http.Response response =
                                          //     await http.post(
                                          //   Uri.parse(
                                          //       'http://10.0.2.2:8000/api/orders/add'),
                                          //   body: {
                                          //       //الشرح على الموبايل
                                          //     // List.generate(controller.itemsQuantity.length, (index){
                                          //     //   return {
                                          //     //     "medicine_id":
                                          //     //   };
                                          //     // })
                                          //     /*حط هون ليست جينيريت و  حط طولها هوو:1
                                          //   itemsQuantity.length
                                          //   الموجودة بالكونترولر

                                          //   2: حط
                                          //   {
                                          //     __________________________________
                                          //       "medicine_id": '4',
                                          //       ==>.بدال 4 حط الميديسين ايدي يلي حا تخزنو بالكونترولر(لانك لازم تساوي الليست يلي هونيك هي ليست اوف ماب)
                                          //       حيث هون بحط كآخر شي
                                          //       itemQuantity[index]['medicine_id']
                                          //       _________________________________
                                          //       "quantity": '5',
                                          //       ==> itemQuantity[index]['quantity']
                                          //       },
                                          //   */

                                          //     // [
                                          //     //   {
                                          //     //     "medicine_id": '4',
                                          //     //     "quantity": '5',
                                          //     //   },
                                          //     // ]
                                          //     //data which I will send it with request
                                          //   },
                                          //   headers: {
                                          //     'Content-Type':
                                          //         'application/json',
                                          //     'Accept': 'application/json',
                                          //     'Authorization': 'Bearer ',
                                          //   },
                                          // );

                                          // Show the dialog
                                         showDialogConfirmOrder(context);
                                        },
                                        child: const Text(
                                          'Place Order',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Open Sans',
                                            color: Color(0xffDCEFFD),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              // },
                              // ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      items.clear();
                                    });
                                  },
                                  child: const Text(
                                    'Delete Order',
                                    style: TextStyle(
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
                : const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'There is no order',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff003A71),
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ));
    // }else {
    //         return SizedBox(
    //           height: MediaQuery.of(context).size.height / 1.2,
    //           child: const Center(
    //             child: CircularProgressIndicator(
    //               color: Color(0xff88BFDD),
    //             ),
    //           ),
    //         );
    //       }

    // });
  }
}
