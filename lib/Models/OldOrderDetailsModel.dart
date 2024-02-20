import 'dart:convert';

import 'package:flutter/foundation.dart';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class OldOrderDetailsModel {
  final int id;
  final int userId;
  final String orderDate;
  final int payedStatus;
  final String orderStatus;
  final num price;
  final List<Medicine> medicines;
  const OldOrderDetailsModel({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.payedStatus,
    required this.orderStatus,
    required this.price,
    required this.medicines,
  });
  factory OldOrderDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return OldOrderDetailsModel(
      id: jsonData["id"],
      orderDate: jsonData["order date"],
      payedStatus: jsonData["payed"],
      price: jsonData["total price"],
      orderStatus: jsonData["status"],
      userId: jsonData["user id"],
      medicines: jsonData['medicines'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'orderDate': orderDate,
      'payedStatus': payedStatus,
      'orderStatus': orderStatus,
      'price': price,
      'medicines': medicines.map((x) => x.toMap()).toList(),
    };
  }

  factory OldOrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OldOrderDetailsModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      orderDate: map['orderDate'] as String,
      payedStatus: map['payedStatus'] as int,
      orderStatus: map['orderStatus'] as String,
      price: map['price'] as num,
      medicines: List<Medicine>.from(
        (map['medicines'] as List<int>).map<Medicine>(
          (x) => Medicine.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OldOrderDetailsModel(id: $id, userId: $userId, orderDate: $orderDate, payedStatus: $payedStatus, orderStatus: $orderStatus, price: $price, medicines: $medicines)';
  }

  @override
  bool operator ==(covariant OldOrderDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.orderDate == orderDate &&
        other.payedStatus == payedStatus &&
        other.orderStatus == orderStatus &&
        other.price == price &&
        listEquals(other.medicines, medicines);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        orderDate.hashCode ^
        payedStatus.hashCode ^
        orderStatus.hashCode ^
        price.hashCode ^
        medicines.hashCode;
  }
}

//________________________________________
class Medicine {
  final String commercialName;
  final String image;
  final int quantity;
  final num quantityPrice;

  const Medicine({
    required this.commercialName,
    required this.image,
    required this.quantity,
    required this.quantityPrice,
  });
  factory Medicine.fromJson(jsonData) {
    return Medicine(
      commercialName: jsonData['commercial name'],
      image: jsonData['image'],
      quantity: jsonData['quantity'],
      quantityPrice: jsonData['quantity price'],
    );
  }

  Medicine copyWith({
    String? commercialName,
    String? image,
    int? quantity,
    double? quantityPrice,
  }) {
    return Medicine(
      commercialName: commercialName ?? this.commercialName,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      quantityPrice: quantityPrice ?? this.quantityPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commercialName': commercialName,
      'image': image,
      'quantity': quantity,
      'quantityPrice': quantityPrice,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      commercialName: map['commercialName'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as int,
      quantityPrice: map['quantityPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Medicine(commercialName: $commercialName, image: $image, quantity: $quantity, quantityPrice: $quantityPrice)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.commercialName == commercialName &&
        other.image == image &&
        other.quantity == quantity &&
        other.quantityPrice == quantityPrice;
  }

  @override
  int get hashCode {
    return commercialName.hashCode ^
        image.hashCode ^
        quantity.hashCode ^
        quantityPrice.hashCode;
  }
}
