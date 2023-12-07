import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteOrderService {
  Future<void> deleteOrder(
      {required int orderId, required String token}) async {
    final url =
        Uri.parse('http://10.0.2.2:8000/api/orders/delete?order_id=$orderId');

    try {
      final response =
          await http.delete(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        print('Order deleted successfully');
      } else {
        print('Failed to delete order. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

// Usage

