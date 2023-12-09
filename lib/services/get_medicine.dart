import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacist_app/Models/get_medicine_model.dart';


class AllMedicineService {

  Future<List<MedicineModel>> getMedicine({required String? token}) async {
   http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/companies/detail?company_id=1'),headers: {"Authorization":'Bearer $token'});
  if (response.statusCode ==200) {
 Map<String,dynamic> data= jsonDecode(response.body);  
  List<MedicineModel> MedicineList = [];
for(int i=0; i<data['data'].length ; i++)  
  {
    MedicineList.add(
      MedicineModel.fromJson(data['data'][i]),
    );
  } 
  
   return  MedicineList ; 
}
else{
  throw Exception("There Is a Problem  with statusCode ${response.statusCode}");
}
}
}
