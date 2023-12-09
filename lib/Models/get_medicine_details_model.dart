// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class MedicineDetailsModel {
  final int id;
  final String scientificName;
  final String commercialName;
  final int quantity;
  final double price;
  final String expirationDate;
  final String image;
  final Companys company;
  final List<Categorys> category;

  MedicineDetailsModel(
      {required this.category,
      required this.company,
      required this.image,
      required this.scientificName,
      required this.quantity,
      required this.price,
      required this.expirationDate,
      required this.id,
      required this.commercialName});
  factory MedicineDetailsModel.fromJson(jsonData) {
    // Assuming 'category' is a key in the JSON data containing a list
    List<dynamic> categoryData = jsonData['category'] ?? [];
    
    List<Categorys> categoryList =
        categoryData.map((item) => Categorys.fromJson(item)).toList();

    return MedicineDetailsModel(
        id: jsonData['id'],
        scientificName: jsonData['scientific name'],
        commercialName: jsonData['commercial name'],
        quantity: jsonData['quantity'],
        price: jsonData['price'],
        expirationDate: jsonData['expiration date'],
        image: jsonData['image'],
        company: Companys.fromJson(jsonData['company']),
        category: categoryList);
  }
}

class Companys {
  final int id;
  final String name;
  Companys({required this.id, required this.name});
  factory Companys.fromJson(jsonDate) {
    return Companys(
      id: jsonDate['id'],
      name: jsonDate['name'],
    );
  }
}

// class CategoryList {
//   final List<Categorys> categories;

//   CategoryList({
//     required this.categories,
//   });
//   // factory CategoryList.fromJson(jsonDate){
//   //   return CategoryList(
//   //    categories:
//   // );}

//   CategoryList copyWith({
//     List<Categorys>? categories,
//   }) {
//     return CategoryList(
//       categories: categories ?? this.categories,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'categories': categories.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory CategoryList.fromMap(Map<String, dynamic> map) {
//     return CategoryList(
//       categories: List<Categorys>.from(
//         (map['categories'] as List<int>).map<Categorys>(
//           (x) => Categorys.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CategoryList.fromJson(String source) =>
//       CategoryList.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'CategoryList(categories: $categories)';

//   @override
//   bool operator ==(covariant CategoryList other) {
//     if (identical(this, other)) return true;

//     return listEquals(other.categories, categories);
//   }

//   @override
//   int get hashCode => categories.hashCode;
// }

class Categorys {
  final int id;
  final String name;
  final String image;
  Categorys({
    required this.id,
    required this.name,
    required this.image,
  });
  factory Categorys.fromJson(jsonDate) {
    return Categorys(
      id: jsonDate['id'],
      name: jsonDate['name'],
      image: jsonDate['image'],
    );
  }

  Categorys copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Categorys(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Categorys.fromMap(Map<String, dynamic> map) {
    return Categorys(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() => 'Categorys(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Categorys other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
