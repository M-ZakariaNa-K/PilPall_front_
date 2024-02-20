import 'dart:convert';

class MedicineModel{
  final int id ;
  final String commercialName;
  String? image;
  MedicineModel({required this.id ,required this.commercialName,this. image});
  factory MedicineModel.fromJson(jsonData){
    return MedicineModel(
      id: jsonData['id'],
      commercialName: jsonData['commercial name'],

    );
  }
   String toJson() => json.encode(toMap());
   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'commercialName':commercialName,
      'image':image
    };
  }
}