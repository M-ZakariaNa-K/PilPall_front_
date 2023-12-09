import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_categories_models.dart';


class AllCategoriesService{
  Future<List<CategoriesModels>> getAllCategory({required String? token}) async {
   http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/categories/list'),headers: {"Authorization":'Bearer $token'});
  
  if (response.statusCode ==200 ) {
Map<String,dynamic> data= jsonDecode(response.body);  
  List<CategoriesModels> categoryList = [];
  for(int i=0; i<data['data'].length ; i++)  
  {
    categoryList.add(
      CategoriesModels.fromJson(data['data'][i]),
    );
  } 
  return categoryList; 
}
else{
   throw Exception("There Is a Problem  with statusCode ${response.statusCode}");
}
  }

}