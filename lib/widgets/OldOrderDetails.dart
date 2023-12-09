//DONE>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/OldOrderDetailsModel.dart';
import 'package:pharmacist_app/services/GetShowOrderDetails1.dart';
import 'package:pharmacist_app/widgets/basket_item_lists.dart';
import 'package:pharmacist_app/widgets/order_category.dart';

int numOfItems = 0;

class OldOrderDetails extends StatelessWidget {
  OldOrderDetails({super.key, required this.orderId});
  int orderId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrderDetails().getShowOrderDetails(
          orderId: orderId, //I define it in order category
          url: 'http://10.0.2.2:8000/api/orders/detail?order_id=54',
          //id:idOrderDetails,
          token:
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjAxNTJkN2ExYjZjZWYyOWM2MjZhMjhhYmU1ZWFkMjg3ODY5MjIwY2U4OWFlOTVlYmI3MDhiZWRmZDIwMmUxNWVmNTNlZjg5YmRlZDRjNTkiLCJpYXQiOjE3MDE5ODYyNzguNzk5NzY2LCJuYmYiOjE3MDE5ODYyNzguNzk5NzY5LCJleHAiOjE3MzM2MDg2NzguNzgyMjE3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.waB1tDS030LWB3piHSGqvI2rmqmFPRsFjR2xeBNGk5WdVWZtbzkNMyMCXmIS0wZmxO7jex7K3ooF26AVXs-j58A5zvnhnkifHXuayzmJpIql1RscOLaB0lfb-Qn3ZlMTirkDkz0vcpD-taaEPmcKS2pWElkQOpCqoULuCSAF_v6oTJRphGxgTbVl30H0lkGwe8-_HVYkeS-ePJU4Lupw4mim9PV_QB6R1neGE82LTLjU4dINr3yVDgjnf1NGCDQTe9NopBTjGM7y1TtGZa5aSChD2YUx4ixwuruEYEbE9jWOF0xzx8Sbo7TvIz4a9rtKKEvaZM_WNjbM98lkQB_dq2XHSyU-yNSJIsna7JHKYAW2FEskV3iKK1N224upPZfXT5tCgcoNOhqHhujj-h2tjBaDaO2-OxunDePW68Il447GAlsIiiP0xxHKphM0hBADxjrgdtG6aFrDmE8GSIMnK5g4-X-Z0HbUJy7U8sglDP9A2oHZJNywx9haPHCFleIXeew_xZNtnyECZdd-cGDSYDNkf2zO1eFPFU7LbHGdQL1xpDdFDyCgAlO7fZnSpWN0f8Zhs0OC6nijjRkZbpQKnfjFZqMMqOuMg56pDKmy6DqOFPN56g0tUH0DV3cCxUe67BjSu_gaO63r_sPRn6-YRHCDzeYuknfP2EedHN1-YKM',
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;

//data == oldOrderDetailsList
            List<Medicine> data = temp;
            numOfItems = data.length;
            return DefaultTabController(
              length: 1,
              child: TabBarView(
                children: List.generate(
                  1,
                  (index) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, ind) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  //data[index].image
                                  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              data[index].quantityPrice.toString() + ' SYR',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Open Sans',
                                  color: Color(0xff003A71),
                                  fontWeight: FontWeight.w300),
                            ),
                            title: Text(
                              data[index].commercialName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xff003A71),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: const Color(0xff013a71).withOpacity(.2),
                          endIndent: 50,
                          indent: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
