import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/splash_screen/welcome_screen/welcome_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find =>Get.find();
  RxBool animate = false.obs;

  @override
  void initState()
  {
    startAnimation();
  }

    Future startAnimation() async{
    await Future.delayed(Duration(milliseconds:500 ));
    
      animate.value = true;
    
    await Future.delayed(Duration(milliseconds:5000 ));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: context=>We))
    Get.to(WelcomeScreen());
  }
}