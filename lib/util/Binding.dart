import 'package:get/get.dart';
import 'package:pharmacist_app/controller/basketController.dart';
import 'package:pharmacist_app/controller/medicineController.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {

    Get.put(MedicineController(), permanent: true);
    Get.put(BasketController(), permanent: true);
  }
}

