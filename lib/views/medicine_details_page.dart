import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_medicine_details_model.dart';
import 'package:pharmacist_app/card/medicine_details.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/get_details_medicine.dart';
import 'package:pharmacist_app/views/basket.dart';

int MedicineId = 1;

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({super.key});

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
        backgroundColor: const Color(0XFF88BFDD),
        title: Text(
          "MedicineDetails".tr,
          style: const TextStyle(fontSize: 25),
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
      body: FutureBuilder<List<MedicineDetailsModel>>(
          future: AllDetailsMedicineService().getAllDetailsMedicineService(
            MedicineId: MedicineId,
            token: tokenVar,
          ),
          builder: (context, snapshot) {
            print('Im snapshotdetails: $snapshot');
            if (snapshot.hasData) {
              List<MedicineDetailsModel> medicine = snapshot.data!;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: medicine.length,
                  itemBuilder: (context, index) {
                    return MedicineDetailsCard(
                      medicine: medicine[index],
                      indexOfMedicine: index,
                      activeBaDetails: false,
                      activeFaDetails: false,
                    );
                  });
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
