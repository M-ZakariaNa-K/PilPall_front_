import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/lang/localeController.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Login_App.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Register_App.dart';
import 'package:pharmacist_app/views/Pharmacy_App/splash.dart';

class first extends StatelessWidget {
  const first({super.key});
  @override
  Widget build(BuildContext context) {
    return splash();
  }
}

class OnePage extends StatelessWidget {
  const OnePage({super.key});
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/pharmacy/pill.png',
                    height: 90.0,
                    width: 90.0,
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/pharmacy/onepage.png',
                height: 350.0,
                width: 350.0,
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(60.0),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Color(HexColor('#88bfdd')),
                          strokeAlign: BorderSide.strokeAlignInside),
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      height: 40.0,
                      onPressed: () {
                        Get.to(() => LoginApp());
                      },
                      child: Text(
                        'login'.tr,
                        style: TextStyle(
                          color: Color(HexColor('#013a71')),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(60.0),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Color(HexColor('#88bfdd')),
                          strokeAlign: BorderSide.strokeAlignCenter),
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      height: 40.0,
                      onPressed: () {
                        Get.to(() => RegisterApp());
                      },
                      child: Text(
                        'signup'.tr,
                        style: TextStyle(
                          color: Color(HexColor('#013a71')),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: const Color(0xff003A71),
                  textColor: Colors.white,
                  onPressed: () {
                    langVar = "ar";
                    controllerLang.changeLang("ar");
                  },
                  child: Text('arabic'.tr),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: const Color(0xff003A71),
                  textColor: Colors.white,
                  onPressed: () {
                    langVar = "en";
                    controllerLang.changeLang("en");
                  },
                  child: Text("english".tr),
                ),
              ),
            ],
          ),
        ),
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
