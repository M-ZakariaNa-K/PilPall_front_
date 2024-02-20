import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/homePage/Login_Api.dart';
import 'package:pharmacist_app/views/Pharmacy_App/HomeLayout.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Register_App.dart';
import 'package:pharmacist_app/views/store_page.dart';
import 'package:pharmacist_app/widgets/showDialog.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    var phonecontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var formkey1 = GlobalKey<FormState>();
    bool ispassword = true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: formkey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/pharmacy/pill.png',
                        width: 80.0,
                        height: 80.0,
                      )),
                ],
              ),
              Center(
                child: Image.asset(
                  'assets/pharmacy/Doctor-pana.png',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'loginLabel'.tr,
                      style: TextStyle(
                          color: Color(HexColor('#013a71')),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phonecontroller,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        label: Text('phone'.tr),
                        prefixIcon: Icon(Icons.phone_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (phonecontroller.text.isEmpty) {
                          return 'phone must not be empty';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: ispassword,
                      controller: passwordcontroller,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        label: Text('password'.tr),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (passwordcontroller.text.isEmpty) {
                          return 'password is must not be empty';
                        }
                        else if(passwordcontroller.text.length<6){
                             return 'password must not be short';
                        }
                        else{

                        }
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color: Color(HexColor('#013a71')),
                        ),
                        child: MaterialButton(
                          height: 40.0,
                          onPressed: () async {
                            if (formkey1.currentState!.validate()) {
                              print(phonecontroller.text);
                              print(passwordcontroller.text);
                              if (phonecontroller.text.length != 13) {
                                showDialogPreperation(
                                  context: context,
                                  message: "Please Enter A Valid Phone Number.",
                                );
                                return;
                              }
                              bool ok = await Login().login(
                                message: "Please Enter A Valid Phone Number.",
                                message1:
                                    " Please Check Sign in Information And Try Again.",
                                context: context,
                                phone: phonecontroller.text,
                                password: passwordcontroller.text,
                              );
                              if (ok = true) {
 //tokenVar =box.read('token');

                                Get.to(
                                  () => StorePage(),
                                  // HomeLayout(),
                                );
                              } else {
                                print('erroe');
                              }
                            }
                          },
                          child: Text(
                            'login'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'account'.tr,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(() => RegisterApp());
                            },
                            child: Text(
                              'signup'.tr,
                              style: TextStyle(
                                  color: Color(HexColor('#013a71')),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
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
