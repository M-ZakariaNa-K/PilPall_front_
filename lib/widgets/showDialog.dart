import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/lang/localeController.dart';
import 'package:pharmacist_app/views/order_page.dart';

MyLocaleController controllerLang = Get.find();
Future<void> showDialogPreperation(
    {required BuildContext context, required String message}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Logo.jpg', width: 70, height: 70),
            Text(message),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showDialogConfirmOrder(
    {required BuildContext context, required String text}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Confirm Order'),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Perform the order placement logic here
            // For example, you can call PostAddOrderService()

            // Close the dialog
            Navigator.pop(context);

            // Navigate to the OrderPage
            Get.off(const OrderPage());
            showDialogPreperation(
                context: context, message: "Your order is in preperation ^_^");
          },
          child: const Text('Place Order'),
        ),
      ],
    ),
  );
}

Future<void> showDialogLang(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Confirm language'),
      content: Text("plz Choose language"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Navigator.pop(context); // Close the dialog
            langVar = "ar";
            controllerLang.changeLang("ar");
          },
          child: Text('arabic'.tr),
        ),
        TextButton(
          onPressed: () {
            langVar = "en";
            controllerLang.changeLang("en");
          },
          child: Text("english".tr),
        ),
      ],
    ),
  );
}






  // Expanded(
  //           child: Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: MaterialButton(
  //                   color: const Color(0xff003A71),
  //                   textColor: Colors.white,
  //                   onPressed: () {
  //                     langVar = "ar";
  //                     controllerLang.changeLang("ar");
  //                   },
  //                   child: Text('arabic'.tr),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: MaterialButton(
  //                   color: const Color(0xff003A71),
  //                   textColor: Colors.white,
  //                   onPressed: () {
  //                     langVar = "en";
  //                     controllerLang.changeLang("en");
  //                   },
  //                   child: Text("english".tr),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )