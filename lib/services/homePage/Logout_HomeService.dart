import 'package:get_storage/get_storage.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class GetLogoutService {
  Future<bool> getlogout() async {
    Map<String, dynamic> data = await api().get(
      // Str:  strVar,
      url: '$projectUrlVar/api/logout',
    );
    // dynamic box=GetStorage();
    if (data != null && data['code'] == 200) {
      box.remove('token');
      return true;
    } else {
      return false;
    }
  }
}
