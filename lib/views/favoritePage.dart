import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/ShowFavoriteModel.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/favorites/DeleteFavoriteService.dart';
import 'package:pharmacist_app/services/favorites/GetShowFavoritesService.dart';
import 'package:pharmacist_app/views/medicine_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          "favorite".tr,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder(
        future: GetShowFavoritesService().getShowFavorite(
          lang: 'ar',
          str: strVar,
          token: tokenVar!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<ShowFavoriteModel> data = temp;
            return data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  '${data[index].commercialName}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0XFF013A71),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                const Divider(
                                  endIndent: 10,
                                  color: Color(0XFFDCEFFD),
                                  thickness: 5,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    MedicineId = data[index].id;
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return const MedicineDetailsPage();
                                      }),
                                    );
                                  },
                                  child: Container(
                                    // See The Details ...
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0XFF88BFDD),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SeeDetails".tr,
                                        style: const TextStyle(
                                          color: Color(0XFF013A71),
                                          fontSize: 19,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      DeleteFavoriteService()
                                          .deleteFavoriteService(
                                        medicineId: data[index].id,
                                        token: tokenVar!,
                                      );
                                      // favoriteList
                                      //     .remove(favoriteList[widget.indexOfItem]);
                                      // // DeleteFavoriteService().deleteFavoriteService(
                                      // //   medicineId: widget.medicine.id,
                                      // //   token:
                                      // //       'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjAxNTJkN2ExYjZjZWYyOWM2MjZhMjhhYmU1ZWFkMjg3ODY5MjIwY2U4OWFlOTVlYmI3MDhiZWRmZDIwMmUxNWVmNTNlZjg5YmRlZDRjNTkiLCJpYXQiOjE3MDE5ODYyNzguNzk5NzY2LCJuYmYiOjE3MDE5ODYyNzguNzk5NzY5LCJleHAiOjE3MzM2MDg2NzguNzgyMjE3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.waB1tDS030LWB3piHSGqvI2rmqmFPRsFjR2xeBNGk5WdVWZtbzkNMyMCXmIS0wZmxO7jex7K3ooF26AVXs-j58A5zvnhnkifHXuayzmJpIql1RscOLaB0lfb-Qn3ZlMTirkDkz0vcpD-taaEPmcKS2pWElkQOpCqoULuCSAF_v6oTJRphGxgTbVl30H0lkGwe8-_HVYkeS-ePJU4Lupw4mim9PV_QB6R1neGE82LTLjU4dINr3yVDgjnf1NGCDQTe9NopBTjGM7y1TtGZa5aSChD2YUx4ixwuruEYEbE9jWOF0xzx8Sbo7TvIz4a9rtKKEvaZM_WNjbM98lkQB_dq2XHSyU-yNSJIsna7JHKYAW2FEskV3iKK1N224upPZfXT5tCgcoNOhqHhujj-h2tjBaDaO2-OxunDePW68Il447GAlsIiiP0xxHKphM0hBADxjrgdtG6aFrDmE8GSIMnK5g4-X-Z0HbUJy7U8sglDP9A2oHZJNywx9haPHCFleIXeew_xZNtnyECZdd-cGDSYDNkf2zO1eFPFU7LbHGdQL1xpDdFDyCgAlO7fZnSpWN0f8Zhs0OC6nijjRkZbpQKnfjFZqMMqOuMg56pDKmy6DqOFPN56g0tUH0DV3cCxUe67BjSu_gaO63r_sPRn6-YRHCDzeYuknfP2EedHN1-YKM',
                                      // // );
                                    });
                                  },
                                  icon: const Icon(
                                    size: 30,
                                    Icons.delete,
                                    color: Color(0xffF44438),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            "there is no favorite item",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff003A71),
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
        },
      ),
    );
  }
}
