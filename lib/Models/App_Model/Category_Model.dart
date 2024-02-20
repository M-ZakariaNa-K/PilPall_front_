
 import 'package:flutter/cupertino.dart';

class CategoryModel{
  final String name;
  final String image;
  final int id;
CategoryModel({
  required this.name,
  required this.image,
  required this.id,
});
factory CategoryModel.fromJson(JsonData){
  return CategoryModel(
      name:JsonData['name'],
      image: JsonData['image'],
      id: JsonData['id']);
 }
}