import 'package:get/get.dart';
import 'package:pharmacist_app/widgets/basket_item.dart';
import 'package:pharmacist_app/widgets/basket_item_lists.dart';

final BasketItemsList objList1 = BasketItemsList();

class BasketController extends GetxController {
  BasketController({int? counter});

  double sum1 = objList1.sums();
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

  String printInfo() {
    return '${counter}';
  }

  void incrementSum(num number) {
    sum1 += number;
    update();
  }

  int counterInt() {
    return counter;
  }

  void decrementSum(num number) {
    sum1 -= number;
    update();
  }

  void delete(int i) {
    items.removeAt(i);
    update();
  }

  //items.length  ==>  is the ;length of the list of items wich it will increase by clicking on (add to basket) in MEDICINE  PAGE
// List<int> itemsQuantity=List<int>.filled(items.length, 1);
  List<int> itemsQuantity = List<int>.generate(items.length, (ind) {
    return 1;
  });
  void storeQuantityIncreament(int index, bool isLongPress) {
    isLongPress == false
        ? itemsQuantity[index] += 1
        : itemsQuantity[index] += 5;
    // itemsQuantity.insert(index,value);
    print(itemsQuantity);
  }

  void storeQuantityDeccreament(int index, bool isLongPress) {
    isLongPress == false
        ? itemsQuantity[index] -= 1
        : itemsQuantity[index] -= 5;
    // itemsQuantity.insert(index,value);
    print(itemsQuantity);
  }

  void isDeleteClicked(int index1) {
    itemsQuantity.removeAt(index1);
  }

}
