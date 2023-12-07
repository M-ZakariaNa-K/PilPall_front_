import 'package:get/get.dart';
import 'package:pharmacist_app/controller/basketController.dart';

class MyBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BasketController(),permanent: true);
  }
  
}