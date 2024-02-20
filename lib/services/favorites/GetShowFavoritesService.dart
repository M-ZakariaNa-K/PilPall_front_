import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/ShowFavoriteModel.dart';
import 'package:pharmacist_app/helper/api1.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class GetShowFavoritesService {
  Future<List<ShowFavoriteModel>> getShowFavorite(
      {required String token, @required int? str, required String lang}) async {
    Map<String, dynamic> data = await Api1().get(
        lang: lang,
        url: '$projectUrlVar/api/favorite/get',
        token: token,
        str: strVar);
    List<ShowFavoriteModel> showFavoriteList = [];
    for (int i = 0; i < data['data'].length; i++) {
      showFavoriteList.add(
        ShowFavoriteModel.fromJson(data['data'][i]),
      );
    }

    return showFavoriteList;
  }
}
