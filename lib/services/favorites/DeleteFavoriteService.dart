import 'package:http/http.dart' as http;
import 'package:pharmacist_app/helper/varibles.dart';

class DeleteFavoriteService {
  Future<void> deleteFavoriteService(
      {required int medicineId, required String token}) async {
    final url =
        Uri.parse('$projectUrlVar/api/favorite/delete?medicine_id=$medicineId');

    try {
      final response = await http
          .delete(url, headers: {'Authorization': 'Bearer $token'}, body: {});
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
