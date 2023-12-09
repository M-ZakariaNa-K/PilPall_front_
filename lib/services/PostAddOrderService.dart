import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api.dart';

class PostAddOrderService {
  Future<List<OrderCategoryModel>> postAddOrderService(
      {required String token,required String url, @required dynamic body}) async {
    // http.Response response = await http.post(
    //   Uri.parse('http://127.0.0.1:8000/api/orders/add'),
    //   body: {
    //     //data which I will send it with request
    //     "medicine_id": 4,
    //     "quantity": 5
    //   },
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer ',
    //   },
    // );
    Map<String, dynamic> data = await Api().post(
      token:
          token,
      url: url,
      body: body
    );
    List<OrderCategoryModel> orderCategoryList = [];
    for (int i = 0; i < data['data'].length; i++) {
      orderCategoryList.add(OrderCategoryModel.fromJson(data['data'][i]));
    }
    return orderCategoryList;
// List<OrderCategoryModel>  orderCategoryList= List.generate(data.length,
//               (index) => OrderCategoryModel.fromMap(data[index]));
    // return orderCategoryList;
  }
}
