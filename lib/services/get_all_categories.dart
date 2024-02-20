import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_categories_models.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class AllCategoriesService {
  Future<List<CategoriesModels>> getAllCategory(
      {required String? token, required int? str}) async {
    http.Response response = await http.get(
        Uri.parse('$projectUrlVar/api/categories/list'),
        headers: {"Authorization": 'Bearer $token', 'Str': '$strVar','App-Local':'$langVar'});
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<CategoriesModels> categoryList = [];
      for (int i = 0; i < data['data'].length; i++) {
        categoryList.add(
          CategoriesModels.fromJson(data['data'][i]),
        );
      }

      return categoryList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
