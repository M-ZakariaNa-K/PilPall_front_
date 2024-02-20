import 'package:pharmacist_app/Models/App_Model/ProfileModel.dart';
import 'package:pharmacist_app/helper/api.dart';
import 'package:pharmacist_app/helper/varibles.dart';


class GetProfileService {
  Future<ProfileModel> getprofile() async {
    Map<String, dynamic> data = await api().get(
      // Str:  strVar,
      url: '$projectUrlVar/api/',
    );

    print("hiiiiiiiiiiiiiiiiii");
    return ProfileModel.fromJson(data['data']);
  }
}