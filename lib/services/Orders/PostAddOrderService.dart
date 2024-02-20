import 'package:pharmacist_app/helper/api1.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class PostAddOrderService {
  Future<dynamic> postAddOrderService({
    required int str,
    required String token,
  }) async {
    Map<String, dynamic> data = await Api1().post(
      str: str,
      token: token,
      url: '$projectUrlVar/api/orders/add',
      body: {
        "order": basketItemsPlaceOrderList1,
      },
    );

    return data;
  }
}
