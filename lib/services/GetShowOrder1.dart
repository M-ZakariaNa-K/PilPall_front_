
import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api.dart';
//OLDEST ORDERS
//succsessful Orders Retrieving
class GetShowOrder1 {
  Future<List<OrderCategoryModel>> getShowOrder({required String token}) async {
    
    Map<String, dynamic> data = await Api().get(url:'http://10.0.2.2:8000/api/orders/list',token: '$token');
    List<OrderCategoryModel> showorderList = [];
    for (int i = 0; i < data['data'].length; i++) {
      showorderList.add(
        OrderCategoryModel.fromJson(data['data'][i]),
      );
    }
    
    return showorderList;
  }
}
