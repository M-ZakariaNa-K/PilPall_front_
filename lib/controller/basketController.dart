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
  List<Map<String, dynamic>> basketItemsPlaceOrderList =
      List<Map<String, dynamic>>.generate(items.length, (ind) {
    //items.length == the num of medcines in basket
    return {
      "medicine_id":1,
      "quantity": 1,
    };
  });
  void storeQuantityIncreament(int index, bool isLongPress) {
    isLongPress == false
        ? basketItemsPlaceOrderList[index]["quantity"] += 1
        : basketItemsPlaceOrderList[index]["quantity"] += 5;
    print(basketItemsPlaceOrderList[index]);
  }

  void storeQuantityDeccreament(int index, bool isLongPress) {
    isLongPress == false
        ? basketItemsPlaceOrderList[index]["quantity"] -= 1
        : basketItemsPlaceOrderList[index]["quantity"] -= 5;
    print(basketItemsPlaceOrderList);
  }

  void isDeleteClicked(int index1) {
    try{basketItemsPlaceOrderList.removeAt(index1);}
    catch(e){
      print(e);
    }
  }



}
