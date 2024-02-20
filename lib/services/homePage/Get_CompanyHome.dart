
import 'package:pharmacist_app/Models/App_Model/Company_Model.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class GetcompanyService{
  Future<List<CompanyModel>> getcompany() async{
    Map<String,dynamic> data = await api().get(url:'$projectUrlVar/api/companies/home',
    // Str:  strVar,
    );
    print(data);
  List<CompanyModel> CompanyLists =[];
    for(int i=0; i<data['data'].length; i++){
      CompanyLists.add(CompanyModel.fromJson(data['data'][i]));}
    return CompanyLists;
  }
 }