import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_medicine_model.dart';
import 'package:pharmacist_app/card/medicine_card.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/get_medicine.dart';
import 'package:pharmacist_app/services/get_medicine_category.dart';
import 'package:pharmacist_app/views/basket.dart';

class CategoryMedicinePage extends StatelessWidget {
  const CategoryMedicinePage({super.key, required this.category_id});
  final int category_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCEFFD),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        backgroundColor: Color(0XFF88BFDD),
        title: Text(
          "Medicines".tr,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BasketPage();
              },
            ),
          );
        },
        backgroundColor: const Color(0xff88BFDD),
        tooltip: 'Go to Basket',
        child: const Icon(
          Icons.shopping_basket,
          color: Color(0xffDCEFFD),
        ),
      ),
      body: FutureBuilder<List<MedicineModel>>(
          future: AllCategoriesMedicineService().getCategoriesMedicine(
            category_id: category_id,
            str: strVar,
            token: tokenVar,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MedicineModel> medicine = snapshot.data!;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return MedicineCard(
                    indexOfCard: index,
                    ifFaclicked: false,
                    ifBaclicked: false,
                    medicine: medicine[index],
                  );
                },
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff88BFDD),
                  ),
                ),
              );
            }
          }),
    );
  }
}
