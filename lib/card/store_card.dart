import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_store_model.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/views/Pharmacy_App/HomeLayout.dart';


class StoreCard extends StatelessWidget {
  StoreCard({super.key, required this.stores});
  final StoresModel stores;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        strVar = stores.id;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const HomeLayout();
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0XFF88BFDD),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              stores.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0XFF003A71),
                fontSize: 27,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
