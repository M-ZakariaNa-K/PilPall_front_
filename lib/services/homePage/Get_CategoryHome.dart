
import 'package:pharmacist_app/Models/App_Model/Category_Model.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';


class GetCategoryService {
  Future<List<CategoryModel>> getCategory() async {
    Map<String, dynamic> data = await api().get(
      url: '$projectUrlVar/api/categories/home',
// Str:  strVar
    );
  //List<Map<String,dynamic>> categoryData=data['data'];
    List<CategoryModel> CategoryLists = [];
   // print(categoryData);
    for (int i = 0; i < data['data'].length; i++) {
      CategoryModel cm =CategoryModel.fromJson(data['data'][i]);
      CategoryLists.add(cm);
      print(cm.name);
    }
    return CategoryLists;
  }
}
