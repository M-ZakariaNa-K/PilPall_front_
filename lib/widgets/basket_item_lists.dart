import 'package:flutter/material.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/widgets/basket_item.dart';


int index = 0;
double sum = 0.0;

class BasketItemsList extends StatelessWidget {
  const BasketItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    print('summmmmm' + '${sums()}');
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return BasketItem(
            onePiecePrice: basketItems[i].quantityPrice,
            item: basketItems[i],
            i: i,
          );
        },
        childCount: basketItems.length,
      ),
    );
  }
}

double sums() {
  for (int i = 0; i < basketItems.length; i++) {
    sum += basketItems[i].quantityPrice;
  }
  return sum;
}