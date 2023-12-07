
class OrderCategoryModel {
  final int id;
  final int? userId;
  final String? orderDate;
  final int? payedStatus;
  final String? orderStatus;
  final double? price;
  const OrderCategoryModel({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.payedStatus,
    required this.orderStatus,
    required this.price,
  });
  factory OrderCategoryModel.fromJson(Map<String,dynamic>jsonData) {
    return OrderCategoryModel(
      
      id: jsonData['id'] as int,
      orderDate: jsonData["order date"],
      payedStatus: jsonData["payed"],
      price: jsonData["total price"],
      orderStatus: jsonData["status"],
      userId:jsonData["user id"], 
    );
  }
 

  OrderCategoryModel copyWith({
    String? token,
    int? id,
    int? userId,
    String? orderDate,
    int? payedStatus,
    String? orderStatus,
    double? price,
  }) {
    return OrderCategoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderDate: orderDate ?? this.orderDate,
      payedStatus: payedStatus ?? this.payedStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      price: price ?? this.price,
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
    };
  }





  @override
  String toString() {
    return 'OrderCategoryModel( id: $id, userId: $userId, orderDate: $orderDate, payedStatus: $payedStatus, orderStatus: $orderStatus, price: $price)';
  }

  @override
  bool operator ==(covariant OrderCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.orderDate == orderDate &&
      other.payedStatus == payedStatus &&
      other.orderStatus == orderStatus &&
      other.price == price;
  }

  @override
  int get hashCode {
    return 
      id.hashCode ^
      userId.hashCode ^
      orderDate.hashCode ^
      payedStatus.hashCode ^
      orderStatus.hashCode ^
      price.hashCode;
  }


}
