import 'dart:convert';

class ShowFavoriteModel {
  final int id;
  final String commercialName;
  final String image;
  ShowFavoriteModel(
      {required this.id, required this.commercialName, required this.image});
  factory ShowFavoriteModel.fromJson(jsonData) {
     if (jsonData == null) {
    // Handle the case where jsonData is null, for example, by returning a default instance.
    return ShowFavoriteModel(id: 0, commercialName: '', image: '');
  }
    return ShowFavoriteModel(
      id: jsonData['id']??0,
      commercialName: jsonData['commercial name']??"",
      image: jsonData['image']??'',
    );
  }
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'commercialName': commercialName,
      'image': image,
    };
  }
}
