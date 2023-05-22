import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    
      animate = true.obs;
    
    await Future.delayed(Duration(milliseconds:5000 ));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: context=>We))
    // Get.to(WelcomeScreen());
  }
}