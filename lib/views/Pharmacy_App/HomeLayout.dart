import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Home_App.dart';
import 'package:pharmacist_app/views/basket.dart';
import 'package:pharmacist_app/views/favoritePage.dart';
import 'package:pharmacist_app/views/notifactionsView.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  int current = 0;
  List<Widget> screens = [
    HomeApp(),
    BasketPage(),
    const NotifactionView(),
    const FavoritePage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(HexColor('#88bfdd')),
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_sharp),
            label: 'Basket'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'favorite'.tr,
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
