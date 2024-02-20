import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api1.dart';
import 'package:pharmacist_app/helper/varibles.dart';

//OLDEST ORDERS
//succsessful Orders Retrieving
class GetShowOrder1 {
  Future<List<OrderCategoryModel>> getShowOrder({
    required String token,
    required String lang,
  }) async {
    Map<String, dynamic> data = await Api1()
        // ignore: missing_required_param
        .get(
      url: '$projectUrlVar/api/orders/list',
      token: token,
      lang: lang,
    );
    List<OrderCategoryModel> showorderList = [];

    for (int i = 0; i < data['data'].length; i++) {
      showorderList.add(
        OrderCategoryModel.fromJson(data['data'][i]),
      );
    }

    return showorderList;
  }
}
