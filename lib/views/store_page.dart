import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_store_model.dart';
import 'package:pharmacist_app/card/store_card.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/get_all_stores.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCEFFD),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFF88BFDD),
        automaticallyImplyLeading: false,
        title: Text(
          "stores".tr,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder<List<StoresModel>>(
          future: AllStoresService().getAllCompanies(
            token: tokenVar,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<StoresModel> Store = snapshot.data!;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Store.length,
                  itemBuilder: (context, index) {
                    return StoreCard(
                      stores: Store[index],
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
