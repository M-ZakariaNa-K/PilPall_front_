import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/services/homePage/Register_Api.dart';
import 'package:pharmacist_app/views/Pharmacy_App/HomeLayout.dart';
import 'package:pharmacist_app/views/Pharmacy_App/Login_App.dart';
import 'package:pharmacist_app/views/store_page.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});
  @override

  Widget build(BuildContext context) {
    bool ispassword=true;
    bool isconpassword=true;
    var firstnamecont=TextEditingController();
    var lastnamecont=TextEditingController();
    var phonecont=TextEditingController();
    var addresscont=TextEditingController();
    var passcont=TextEditingController();
    var conpasscont=TextEditingController();
    var formkey= GlobalKey<FormState>();
    return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children:
            [
              SizedBox(height: 10,),
              Center(
                child:
            Image.asset(
            'assets/pharmacy/PillPal.png',
          height: 200.0,
          width: 200.0,
        )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(
                        'GetStarted'.tr,
                        style: TextStyle(
                            color: Color(HexColor('#013a71')),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: firstnamecont,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          label: Text('First Name'.tr),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator:(value) {
                          if (firstnamecont.text.isEmpty) {
                            return 'name must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: lastnamecont,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          label: Text('Last Name'.tr),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (lastnamecont.text.isEmpty) {
                            return 'name must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phonecont,
                        onFieldSubmitted: (value){
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
                          if (phonecont.text.isEmpty) {
                            return 'phone must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: addresscont,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          label: Text('Address'.tr),
                          prefixIcon: Icon(Icons.home),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (addresscont.text.isEmpty) {
                            return 'address must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passcont,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        obscureText: ispassword,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          label: Text('password'.tr),
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (passcont.text.isEmpty) {
                            return 'password must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: conpasscont,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        obscureText: ispassword,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          label: Text('Confirm'.tr),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (conpasscont.text.isEmpty) {
                            return 'it must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
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
                            onPressed: () async{
                              if(formkey.currentState!.validate()){
                                print(firstnamecont.text);
                                print(lastnamecont.text);
                                print(phonecont.text);
                                print(addresscont.text);
                                print(conpasscont.text);
                                print(passcont.text);
                              }
                              bool ok=  await Register().register(
                                  first_name: firstnamecont.text,
                                  last_name: lastnamecont.text,
                                  phone: phonecont.text,
                                  address: addresscont.text,
                                  password: passcont.text,
                                  confirm_password: conpasscont.text) ;
                            if(ok){
                              Get.to(
                                  () => StorePage(),);
                            }else{
                              print('error');
                            }
                            },
                            child: Text(
                              'signup'.tr,
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
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
                         children:
                         [
                           Text(
                             'hasAccount'.tr,
                             style:const TextStyle(
                               color: Colors.grey,
                               fontSize: 15.0,
                               fontWeight: FontWeight.w400
                             ),
                           ),
                           TextButton(
                             onPressed: (){
                               Get.off(()=>LoginApp());
                             },
                             child: Text(
                             'login'.tr,
                             style: TextStyle(
                                 color: Color(HexColor('#013a71')),
                                 fontSize: 15.0,
                                 fontWeight: FontWeight.w500
                             ),
                           ),),
                         ],
                       ),
                     ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
  }
}
int HexColor(String c){
  String sColor ='0xff'+c;
  sColor=sColor.replaceAll('#', '');
  int dColor=int.parse(sColor);
  return dColor;
}