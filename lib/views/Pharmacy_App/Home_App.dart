import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/App_Model/Category_Model.dart';
import 'package:pharmacist_app/Models/App_Model/Company_Model.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/lang/localeController.dart';
import 'package:pharmacist_app/services/homePage/Get_CategoryHome.dart';
import 'package:pharmacist_app/services/homePage/Get_CompanyHome.dart';
import 'package:pharmacist_app/services/homePage/Login_Api.dart';
import 'package:pharmacist_app/services/homePage/Logout_HomeService.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Login_App.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Search_App.dart';
import 'package:pharmacist_app/views/basket.dart';
import 'package:pharmacist_app/views/categories-page.dart';
import 'package:pharmacist_app/views/company_page.dart';
import 'package:pharmacist_app/views/medicine_page.dart';
import 'package:pharmacist_app/views/medicines_categories_page.dart';
import 'package:pharmacist_app/views/order_page.dart';
import 'package:pharmacist_app/widgets/showDialog.dart';

void runsearch(String enterkeyword) {
  List<Map<String, dynamic>> results = [];
}

class HomeApp extends StatelessWidget {
  HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    var valuesearch = TextEditingController();
    return Scaffold(
      // drawer: SafeArea(
      //   child: Drawer(
      //       child: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           stops: [0.1, 0.4, 1],
      //           begin: Alignment.bottomLeft,
      //           end: Alignment.topRight,
      //           colors: [
      //             Colors.blueGrey,
      //             Colors.white,
      //             Colors.blueGrey,
      //           ]),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 30.0),
      //       child: ListView(
      //         padding: EdgeInsets.zero,
      //         children: [
      //           // FutureBuilder<ProfileModel>(
      //           //     future: GetProfileService().getprofile(),
      //           //     builder: (context, snapshot) {
      //           //       if (snapshot.hasData) {
      //           //         ProfileModel profile = snapshot.data!;
      //           //         return  UserAccountsDrawerHeader(
      //           //             currentAccountPicture: CircleAvatar(
      //           //                 backgroundImage: NetworkImage('${profile.image}')),
      //           //             decoration: BoxDecoration(
      //           //               color: Color(HexColor('#013a71')),
      //           //             ),
      //           //             accountName: Text(
      //           //               '${profile.name}',
      //           //               style: TextStyle(
      //           //                 color: Colors.white,
      //           //               ),
      //           //             ),
      //           //             accountEmail: Text(
      //           //               '${profile.phone}',
      //           //               style: TextStyle(
      //           //                 color: Colors.grey,
      //           //               ),
      //           //             ));
      //           //       } else {
      //           //         return Center(child: CircularProgressIndicator());
      //           //       }
      //           //     }),
      //           ListTile(
      //             leading: const Icon(Icons.shopping_basket_rounded),
      //             title: Text('Basket'),
      //             onTap: () {
      //               Get.to(() => basket());
      //             },
      //           ),
      //           ListTile(
      //             leading: const Icon(Icons.notifications),
      //             title: Text('Notifications'),
      //             onTap: () {
      //
      //             },
      //           ),
      //           ListTile(
      //             leading: const Icon(Icons.favorite),
      //             title: Text('Favourite'),
      //             onTap: () {
      //               Get.to(() => Favourite());
      //             },
      //           ),
      //           Spacer(),
      //           ListTile(
      //             leading: const Icon(Icons.cancel_presentation),
      //             title: Text('Logout'),
      //             onTap: ()async {
      //
      //             bool ok= await  GetLogoutService().getlogout();
      //             if(true){
      //               Get.to(()=>LoginApp());
      //             }else{
      //               print('erroe');
      //             }
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   )),
      // ),
      appBar: AppBar(
        backgroundColor: Color(HexColor('#013a71')),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchMedicine());
                },
                icon: const Icon(
                  Icons.search,
                  size: 27,
                  color: Colors.white,
                )),
          ),
          IconButton(
            onPressed: () async {
              bool ok = await GetLogoutService().getlogout();
              if (ok) {
                Get.off(() => const LoginApp());
              } else {
                print('erroe');
              }
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          //lang
          IconButton(
            onPressed: () async {
              showDialogLang(context);
            },
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
          ),
          //------------------------------
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            ' PILLPAL ',
            style: TextStyle(
                color: Color(
                  HexColor('#dceffd'),
                ),
                fontSize: 20.0,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 30),
            child: Container(
              height: 200.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                color: Color(HexColor('#88bfdd')),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  'Order Medicine'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(HexColor('#013a71')),
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  'tell us'.tr,
                                  style: TextStyle(
                                    color: Color(HexColor('#013a71')),
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 150.0,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(HexColor('#013a71')),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              70.0)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Get.to(const OrderPage());
                                    },
                                    child: Center(
                                      child: Text(
                                        'See Order'.tr,
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Image.asset(
                                'assets/pharmacy/order.png',
                                width: 160.0,
                                height: 160.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  'category'.tr,
                  style: TextStyle(
                      color: Color(HexColor('#013a71')),
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(HexColor('#88bfdd')),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(CategoriesPage());
                      },
                      child: Text(
                        'View All'.tr,
                        style: TextStyle(
                          color: Color(HexColor('#013a71')),
                        ),
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Container(
                height: 150,
                child: FutureBuilder<List<CategoryModel>>(
                    future: GetCategoryService().getCategory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<CategoryModel> category = snapshot.data!;
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 6,
                                ),
                            itemBuilder: (contex, index) =>
                                buildItemCategory(category[index]),
                            itemCount: category.length);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  'companies'.tr,
                  style: TextStyle(
                      color: Color(HexColor('#013a71')),
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(HexColor('#88bfdd')),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(CompanyPage());
                      },
                      child: Text(
                        'View All'.tr,
                        style: TextStyle(
                          color: Color(HexColor('#013a71')),
                        ),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FutureBuilder<List<CompanyModel>>(
                  future: GetcompanyService().getcompany(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CompanyModel> company = snapshot.data!;
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 15,
                              ),
                          itemBuilder: (contex, index) =>
                              buildItemcompany(company[index]),
                          itemCount: company.length);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

int HexColor(String c) {
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}

Widget buildItemCategory(CategoryModel cat) => Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              color: Colors.grey.shade200),
          child: MaterialButton(
              onPressed: () {
                Get.to(CategoryMedicinePage(
                  category_id: cat.id,
                ));
              },
              child: Center(
                child: Image.network(
                  //medicine.image
                  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  width: 100,
                  height: 100,
                ),
              )),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          '${cat.name}',
          style: TextStyle(
              color: Color(HexColor('#013a71')),
              fontWeight: FontWeight.w500,
              fontSize: 11.0),
        ),
      ],
    );
Widget buildItemcompany(CompanyModel com) => Container(
      height: 80.0,
      width: 180.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.grey.shade200),
      child: MaterialButton(
        onPressed: () {
          Get.to(MedicinePage(
            company_id: com.id,
          ));
        },
        child: Center(
          child: Text(
            '${com.name}',
            style: TextStyle(color: Color(HexColor('#013a71')), fontSize: 15.0),
          ),
        ),
      ),
    );
