import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_categories_models.dart';
import 'package:pharmacist_app/card/category_card.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/get_all_categories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage();

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCEFFD),
      appBar: AppBar(
        backgroundColor: Color(0XFF88BFDD),
        title: Text('categories'.tr),
      ),
      body: FutureBuilder<List<CategoriesModels>>(
          future: AllCategoriesService().getAllCategory(
            
            token: tokenVar,
            str: strVar,
            //  saveStr(),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('snapshot: ${snapshot.data}');
              List<CategoriesModels> category = snapshot.data!;
              return ListView.builder(
                  itemCount: category.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: category[index],
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
