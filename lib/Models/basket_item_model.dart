
class BasketItemModel{
  final String name;
   num quantityPrice;
  final String image;
  final int amount;
  int counter;
  final int? quantity;
  BasketItemModel({
    this.quantity,
    required this.name,
    required this.quantityPrice,
    required this.image,
    required this.amount,
    required this.counter,
  });
  
}
