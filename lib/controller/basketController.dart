import 'package:get/get.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/widgets/basket_item.dart';
import 'package:pharmacist_app/widgets/basket_item_lists.dart';

final BasketItemsList objList1 = BasketItemsList();

num sum1 = sums() / 2;

class BasketController extends GetxController {
  BasketController({int? counter});

  int increment() {
    counter++;
    update();
    return counter;
  }

  int decrement() {
    counter--;
    update();
    return counter;
  }

  void incrementSum(num number) {
    sum1 += number;
    update();
  }

  void decrementSum(num number) {
    sum1 -= number;
    update();
  }

  void delete(int i) {
    basketItems.removeAt(i);
    update();
  }

// _______________________________________
  void isDeleteClicked(int index1) {
    try {
      basketItemsPlaceOrderList1.removeAt(index1);
      //basketItems.removeAt(index1);
    } catch (e) {
      print(e);
    }
  }
}
