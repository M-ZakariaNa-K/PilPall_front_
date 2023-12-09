import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_medicine_model.dart';
import 'package:pharmacist_app/card/medicine_card.dart';
import 'package:pharmacist_app/services/get_medicine.dart';
import 'package:pharmacist_app/views/basket.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCEFFD),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        backgroundColor: Color(0XFF88BFDD),
        title:const  Text(
          "Medicines",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/basketPage');
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
        child:const  Icon(
          Icons.shopping_basket,
          color: Color(0xffDCEFFD),
        ),
      ),
      body: FutureBuilder<List<MedicineModel>>(
          future: AllMedicineService().getMedicine(
              token:
                  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjAxNTJkN2ExYjZjZWYyOWM2MjZhMjhhYmU1ZWFkMjg3ODY5MjIwY2U4OWFlOTVlYmI3MDhiZWRmZDIwMmUxNWVmNTNlZjg5YmRlZDRjNTkiLCJpYXQiOjE3MDE5ODYyNzguNzk5NzY2LCJuYmYiOjE3MDE5ODYyNzguNzk5NzY5LCJleHAiOjE3MzM2MDg2NzguNzgyMjE3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.waB1tDS030LWB3piHSGqvI2rmqmFPRsFjR2xeBNGk5WdVWZtbzkNMyMCXmIS0wZmxO7jex7K3ooF26AVXs-j58A5zvnhnkifHXuayzmJpIql1RscOLaB0lfb-Qn3ZlMTirkDkz0vcpD-taaEPmcKS2pWElkQOpCqoULuCSAF_v6oTJRphGxgTbVl30H0lkGwe8-_HVYkeS-ePJU4Lupw4mim9PV_QB6R1neGE82LTLjU4dINr3yVDgjnf1NGCDQTe9NopBTjGM7y1TtGZa5aSChD2YUx4ixwuruEYEbE9jWOF0xzx8Sbo7TvIz4a9rtKKEvaZM_WNjbM98lkQB_dq2XHSyU-yNSJIsna7JHKYAW2FEskV3iKK1N224upPZfXT5tCgcoNOhqHhujj-h2tjBaDaO2-OxunDePW68Il447GAlsIiiP0xxHKphM0hBADxjrgdtG6aFrDmE8GSIMnK5g4-X-Z0HbUJy7U8sglDP9A2oHZJNywx9haPHCFleIXeew_xZNtnyECZdd-cGDSYDNkf2zO1eFPFU7LbHGdQL1xpDdFDyCgAlO7fZnSpWN0f8Zhs0OC6nijjRkZbpQKnfjFZqMMqOuMg56pDKmy6DqOFPN56g0tUH0DV3cCxUe67BjSu_gaO63r_sPRn6-YRHCDzeYuknfP2EedHN1-YKM'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MedicineModel> medicine = snapshot.data!;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return MedicineCard(
                    
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
