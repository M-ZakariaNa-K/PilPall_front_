import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/ShowFavoriteModel.dart';
import 'package:pharmacist_app/helper/api1.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class PostAddFavoriteService {
  Future<ShowFavoriteModel> postAddFavoriteService(
      {@required int? str,
      required String token,
      required int medicineId}) async {
    // ignore: missing_required_param
    dynamic data = await Api1().post(
      str: strVar,
      token: token,
      url: '$projectUrlVar/api/favorite/add?medicine_id=$medicineId',
    );

    return ShowFavoriteModel.fromJson(data);
  }
}
