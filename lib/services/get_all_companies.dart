import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_companies_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class AllCompaniesService {
  Future<List<CompaniesModel>> getAllCompanies(
      {required String? token, required int str}) async {
    http.Response response = await http.get(
        Uri.parse('$projectUrlVar/api/companies/list'),
        headers: {"Authorization": 'Bearer $token', 'Str': '$strVar'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<CompaniesModel> companyList = [];
      for (int i = 0; i < data['data'].length; i++) {
        companyList.add(
          CompaniesModel.fromJson(data['data'][i]),
        );
      }
      return companyList;
    } else {
      throw Exception(
          "There Is a Problem  with statusCode ${response.statusCode}");
    }
  }
}
