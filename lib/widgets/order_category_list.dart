// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:pharmacist_app/Models/order_category_model.dart';
// import 'package:pharmacist_app/helper/api.dart';
// import 'package:pharmacist_app/views/basket.dart';
// import 'package:pharmacist_app/widgets/order_category.dart';

  
// // ignore: must_be_immutable
// class OrderCategoryList extends StatefulWidget {
//   OrderCategoryList({Key? key}) : super(key: key);

//   @override
//   State<OrderCategoryList> createState() => _OrderCategoryListState();
// }

// class _OrderCategoryListState extends State<OrderCategoryList> { List<OrderCategoryModel> orderList= [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // getData();
//   }

//   // Future<void> getData() async {
//   //   var jsonData = await Api().get(url: 'http://10.0.2.2:8000/api/orders/list');
//   //   print(jsonData);
//   //  List<dynamic> data = jsonData['data'];

//   //   for (var dataPart in data) {
//   //     OrderCategoryModel temp = OrderCategoryModel(
//   //       id: dataPart['id'],
//   //       userId: dataPart['user id'],
//   //       orderDate: dataPart['order date'],
//   //       payedStatus: dataPart['payed'],
//   //       orderStatus: dataPart['status'],
//   //       price: dataPart['total price'],
//   //     );
//   //     orderList.add(temp);
//   //   }
//   //   try{ setState(() {});}
//   //   catch(e){
//   //     print('ooooops');
//   //   }
  

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: orderList.length,
//       itemBuilder: (context, i) {
//         return OrderCategory();
//       },
//     );
//   }
// }
