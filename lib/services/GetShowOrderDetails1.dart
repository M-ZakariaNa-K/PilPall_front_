
import 'package:pharmacist_app/Models/OldOrderDetailsModel.dart';
import 'package:pharmacist_app/helper/api.dart';

//Successful Show Order Details
class GetShowOrderDetails {
  Future<List<Medicine>> getShowOrderDetails({required String token, required String url}) async {
    Map<String,dynamic> data = await Api().get(url: url,token: token);
   //if (http://127.0.0.1:8000) not work use (http://10.0.2.2:8000)
    List<Medicine> oldOrderDetailsList = [];
    for (int i = 0; i < data['data']['medicines'].length; i++) {
      
      oldOrderDetailsList.add(Medicine.fromJson(data['data']['medicines'][i]));
    }
    
    return oldOrderDetailsList;
  }

}