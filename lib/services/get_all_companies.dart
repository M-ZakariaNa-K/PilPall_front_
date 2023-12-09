import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_companies_model.dart';

class AllCompaniesService {
  Future<List<CompaniesModel>> getAllCompanies({required String? token}) async {
    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/companies/list'),
        headers: {"Authorization": 'Bearer $token'});
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
