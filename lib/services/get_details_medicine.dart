import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_medicine_details_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class AllDetailsMedicineService {
  Future<List<MedicineDetailsModel>> getAllDetailsMedicineService({
    required String? token,
    required int MedicineId,
  }) async {
    http.Response response = await http.get(
        Uri.parse(
            '$projectUrlVar/api/medicines/detail?medicine_id=$MedicineId'),
        headers: {"Authorization": 'Bearer $token', 'Str': '$strVar'});
    print("Im medicines details : ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<MedicineDetailsModel> companyList = [];
      for (int i = 0; i < data['data'].length; i++) {
        companyList.add(
          MedicineDetailsModel.fromJson(data['data'][i]),
        );
      }
      print("im details: $companyList");
      return companyList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
