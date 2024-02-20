import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
   List<int> _favoritesList=[];
  List<int> get favoritesList=>_favoritesList;

  void toggleFavorite(int medicine){
    final isExist = _favoritesList.contains(medicine);
    if(isExist){
      _favoritesList.remove(medicine);
    }
    else{
      _favoritesList.add(medicine);
    }
    notifyListeners();
  }
bool isExist(int medicineId){
  final isExist = _favoritesList.contains(medicineId);
  return isExist;
}
  void clearFavorite(){
    _favoritesList=[];
    notifyListeners();
  }
}