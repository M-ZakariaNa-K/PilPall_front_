
import 'dart:convert';

SearchEdited welcomeFromJson(String str) =>
    SearchEdited.fromJson(json.decode(str));

String welcomeToJson(SearchEdited data) => json.encode(data.toJson());

class SearchEdited {
  List<Medicine1> medicines;
  List<Category1> categories;

  SearchEdited({
    required this.medicines,
    required this.categories,
  });

  factory SearchEdited.fromJson(Map<String, dynamic> json) => SearchEdited(
        medicines: List<Medicine1>.from(
            json["medicines"].map((x) => Medicine1.fromJson(x))),
        categories: List<Category1>.from(
            json["categories"].map((x) => Category1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category1 {
  int id;
  String name;
  String image;

  Category1({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category1.fromJson(Map<String, dynamic> json) => Category1(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Medicine1 {
  int id;
  String commercialName;
  String image;

  Medicine1({
    required this.id,
    required this.commercialName,
    required this.image,
  });

  factory Medicine1.fromJson(Map<String, dynamic> json) => Medicine1(
        id: json["id"],
        commercialName: json["commercial name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "commercial name": commercialName,
        "image": image,
      };
}
