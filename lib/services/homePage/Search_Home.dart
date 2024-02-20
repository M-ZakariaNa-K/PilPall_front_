import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/App_Model/SearchModelEdit.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class SearchAppService {
  Future<SearchEdited> getsearchapp(@required String query) async {
    Map<String, dynamic> data = await api().get(
      url: '$projectUrlVar/api/search?search=' + query,
    );
    List<dynamic> med = data['data']['medicines'] as List<dynamic>;
    List<dynamic> cat = data['data']['categories'] as List<dynamic>;
    print(med);

    List<Medicine1> medicinesList =
        med.map((json) => Medicine1.fromJson(json)).toList();
    List<Category1> categoriesList =
        cat.map((json) => Category1.fromJson(json)).toList();

    return SearchEdited(
      medicines: medicinesList,
      categories: categoriesList,
    );
  }
}
