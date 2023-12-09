import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/views/order_page.dart';

Future<void> showDialogPreperation(BuildContext context) {
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
            const Text('Your order is in preperation ^_^'),
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
Future<void> showDialogConfirmOrder(BuildContext context){
  return  showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title:
                                                  const Text('Confirm Order'),
                                              content: const Text(
                                                  'Are you sure you want to place the order?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close the dialog
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
                                                   showDialogPreperation(context);
                                                  },
                                                  child:
                                                      const Text('Place Order'),
                                                ),
                                              ],
                                            ),
                                          );
} 
