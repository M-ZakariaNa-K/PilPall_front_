class BasketItemModel {
  final String name; //
  num quantityPrice; //
  final String image; //
  int counter;
  BasketItemModel({
    required this.name,
    required this.quantityPrice,
    required this.image,
    required this.counter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          quantityPrice == other.quantityPrice &&
          image == other.image &&
          counter == other.counter;

  @override
  int get hashCode =>
      name.hashCode ^
      quantityPrice.hashCode ^
      image.hashCode ^
      counter.hashCode;
}
