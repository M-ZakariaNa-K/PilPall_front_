import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_medicine_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class AllMedicineService {
  Future<List<MedicineModel>> getMedicine(
      {required String? token, required int str,required int company_id}) async {
    //IDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
    http.Response response = await http.get(
        Uri.parse('$projectUrlVar/api/companies/detail?company_id=$company_id'),
        headers: {"Authorization": 'Bearer $token', 'Str':'$strVar'});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<MedicineModel> MedicineList = [];
      for (int i = 0; i < data['data'].length; i++) {
        MedicineList.add(
          MedicineModel.fromJson(data['data'][i]),
        );
      }

      return MedicineList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
