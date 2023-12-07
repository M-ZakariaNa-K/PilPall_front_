import 'package:pharmacist_app/Models/order_category_model.dart';
import 'package:pharmacist_app/helper/api.dart';

class PostAddOrderService {
  Future<List<OrderCategoryModel>> postAddOrderService(
      {required String token}) async {
    // http.Response response = await http.post(
    //   Uri.parse('http://127.0.0.1:8000/api/orders/add'),
    //   body: {
    //     //data which I will send it with request
    //     "medicine_id": 4,
    //     "quantity": 5
    //   },
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer ',
    //   },
    // );
    Map<String, dynamic> data = await Api().post(
      token:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA',
      url: 'http://10.0.2.2:8000/api/orders/add',
      body: [
        {
          // data which I will send it with request
          "medicine_id": 'medicine_id',
          "quantity": 'quantity'
        }
      ],
    );
    List<OrderCategoryModel> orderCategoryList = [];
    for (int i = 0; i < data['data'].length; i++) {
      orderCategoryList.add(OrderCategoryModel.fromJson(data['data'][i]));
    }
    return orderCategoryList;
// List<OrderCategoryModel>  orderCategoryList= List.generate(data.length,
//               (index) => OrderCategoryModel.fromMap(data[index]));
    // return orderCategoryList;
  }
}
