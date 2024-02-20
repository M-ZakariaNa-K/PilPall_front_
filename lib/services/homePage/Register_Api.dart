import 'package:get_storage/get_storage.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class Register {
  Future<bool> register({
    required String first_name,
    required String last_name,
    required String phone,
    required String address,
    required String password,
    required String confirm_password,
  }) async {
    Map<String, dynamic> data = await api().post(
      // Str:  strVar,
      url: '$projectUrlVar/api/register',
      body: {
        'first_name': first_name,
        'last_name': last_name,
        'phone': phone,
        'address': address,
        'password': password,
        'confirm_password': confirm_password,
        'device_token': deviceToken,
      },
    );
    //token
    // dynamic box=GetStorage();
    //box.write('token',data['data']['token']);
    if (tokenVar == null) {
      box.write('token', data['data']['token']);
      tokenVar = box.read('token');
      return true;
    } else {
      return false;
    }
  }
}
