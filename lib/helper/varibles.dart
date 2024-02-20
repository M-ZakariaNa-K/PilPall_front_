import 'package:get_storage/get_storage.dart';
import 'package:pharmacist_app/Models/basket_item_model.dart';
import 'package:pharmacist_app/Models/get_medicine_model.dart';
    String? deviceToken;
GetStorage box = GetStorage();
GetStorage storeBox = GetStorage();
String projectUrlVar = 'http://10.0.2.2:8000';
String? tokenDevice;
//if (http://127.0.0.1:8000) not work use (http://10.0.2.2:8000)|| 192.168.0.32

var tokenVar = null;
//  box.read('token');
// int strVar=storeBox.read('Str');
int strVar = 1;
List<MedicineModel> favoriteList = [];
List<Map<String, dynamic>> basketItemsPlaceOrderList1 = [];
List<BasketItemModel> basketItems = [];
String langVar = '';
