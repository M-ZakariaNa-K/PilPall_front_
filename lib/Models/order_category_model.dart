// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderCategoryModel {
  final int id;
  final int? userId;
  final String orderDate;
  final int? payedStatus;
  final String orderStatus;
  final num price;
  final String storehouse;
  final String username;

  const OrderCategoryModel({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.payedStatus,
    required this.orderStatus,
    required this.price,
    required this.storehouse,
    required this.username,
  });
  factory OrderCategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderCategoryModel(
      id: jsonData['id'],
      orderDate: jsonData["order date"],
      payedStatus: jsonData["payed"],
      price: jsonData["total price"],
      orderStatus: jsonData["status"],
      userId: jsonData["user id"],
      username: jsonData["user name"],
      storehouse: jsonData["storehouse"],
    );
  }

  OrderCategoryModel copyWith({
    int? id,
    int? userId,
    String? orderDate,
    int? payedStatus,
    String? orderStatus,
    double? price,
    String? storehouse,
    String? username,
  }) {
    return OrderCategoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderDate: orderDate ?? this.orderDate,
      payedStatus: payedStatus ?? this.payedStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      price: price ?? this.price,
      storehouse: storehouse ?? this.storehouse,
      username: username ?? this.username,
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
      'storehouse': storehouse,
      'username': username,
    };
  }

  @override
  String toString() {
    return 'OrderCategoryModel(id: $id, userId: $userId, orderDate: $orderDate, payedStatus: $payedStatus, orderStatus: $orderStatus, price: $price, storehouse: $storehouse, username: $username)';
  }

  @override
  bool operator ==(covariant OrderCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.orderDate == orderDate &&
        other.payedStatus == payedStatus &&
        other.orderStatus == orderStatus &&
        other.price == price &&
        other.storehouse == storehouse &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        orderDate.hashCode ^
        payedStatus.hashCode ^
        orderStatus.hashCode ^
        price.hashCode ^
        storehouse.hashCode ^
        username.hashCode;
  }

  factory OrderCategoryModel.fromMap(Map<String, dynamic> map) {
    return OrderCategoryModel(
      id: map['id'] as int,
      userId: map['userId'] != null ? map['userId'] as int : null,
      orderDate: map['orderDate'] as String,
      payedStatus:
          map['payedStatus'] != null ? map['payedStatus'] as int : null,
      orderStatus: map['orderStatus'] as String,
      price: map['price'] as double,
      storehouse: map['storehouse'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
