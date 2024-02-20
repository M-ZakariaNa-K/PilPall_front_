// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/OldOrderDetailsModel.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/Orders/GetShowOrderDetails1.dart';

int numOfItems = 0;

// ignore: must_be_immutable
class OldOrderDetails extends StatelessWidget {
  OldOrderDetails({super.key, required this.orderId});
  int orderId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrderDetails().getShowOrderDetails(
          lang: 'ar',
          orderId: orderId, //I define it in order category

          //id:idOrderDetails,
          token: tokenVar!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;

//data == oldOrderDetailsList
            List<Medicine> data = temp;
            numOfItems = data.length;
            return ListView.builder(
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
                        data[ind].quantityPrice.toString() + ' ' + "SYR".tr,
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                            color: Color(0xff003A71),
                            fontWeight: FontWeight.w300),
                      ),
                      title: Text(
                        data[ind].commercialName,
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
