import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifactionView extends StatelessWidget {
  const NotifactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          backgroundColor: const Color(0xff88BFDD),
          title: Text("Notifications".tr),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('assets/images/syringe.png'),
              title: Text("zak"),
              subtitle: Text("zzzzzzzzzzzzzzzzzzzzz"),
            );
          },
        ));
  }
}
