import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_store_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class AllStoresService {
  Future<List<StoresModel>> getAllCompanies({required String? token}) async {
    http.Response response = await http.get(
        Uri.parse('$projectUrlVar/api/storehouses'),
        headers: {"Authorization": 'Bearer $token'});
    print("im stores: ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      // //store StoreHouses
      // storeBox.write('Str', data['data']['Str']);
      // //=============================
      List<StoresModel> StoreList = [];
      for (int i = 0; i < data['data'].length; i++) {
        StoreList.add(
          StoresModel.fromJson(data['data'][i]),
        );
        print("im stores: ${StoreList}");
      }

      return StoreList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
