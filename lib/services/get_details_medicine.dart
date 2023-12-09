import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_medicine_details_model.dart';

class AllDetailsMedicineService {
  Future<List<MedicineDetailsModel>> getAllDetailsMedicineService(
      {required String? token, required int MedicineId}) async {
    http.Response response = await http.get(
        Uri.parse(
            'http://10.0.2.2:8000/api/medicines/detail?medicine_id=$MedicineId'),
        headers: {"Authorization": 'Bearer $token'});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<MedicineDetailsModel> companyList = [];
      for (int i = 0; i < data['data'].length; i++) {
        companyList.add(
          MedicineDetailsModel.fromJson(data['data'][i]),
        );
      }
      return companyList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
