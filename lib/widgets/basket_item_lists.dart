import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/basket_item_model.dart';
import 'package:pharmacist_app/widgets/basket_item.dart';
int index = 0;
List<BasketItemModel> items = [
  BasketItemModel(
    name: 'Paracetamol',
    quantityPrice: 2000,
    image:
        'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
  BasketItemModel(
    name: 'Paracetamol', quantityPrice: 10500,
    image: 'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //the Amount of every drug. it will come from API.
    amount: 0,
    counter: 1,
  ),
];
double sum = 0.0;

// ignore: must_be_immutable
class BasketItemsList extends StatelessWidget {
  BasketItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
          SliverChildBuilderDelegate(childCount: items.length, (context, i) {
        sum += items[i].quantityPrice;
        print(sum);
        return BasketItem(
          onePiecePrice: items[i].quantityPrice,
          item: items[i],
          i: i,
        );
      }),
    );

    // ListView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: items.length,
    //   itemBuilder: (context, i) {
    //     return Expanded(
    //       child: BasketItem(item: items[i]),
    //     );
    //   },
    // );
  }

  double sums() {
    for (int i = 0; i < items.length; i++) {
      sum += items[i].quantityPrice;
    }

    return sum;
  }

  void delete(int i) {
    items.removeAt(i);
  }
}
