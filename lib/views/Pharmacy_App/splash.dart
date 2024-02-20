
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacist_app/views/Pharmacy_App/One_Page.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
class splash extends StatelessWidget {
  const splash({super.key});
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
        splashIconSize: 350,
        pageTransitionType: PageTransitionType.theme,
        splash: Image.asset('assets/pharmacy/PillPal.png',width: 350,
        height: 350,),
        nextScreen: const OnePage());
  }
}
