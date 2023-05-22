import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find =>Get.find();
  RxBool animate = false.obs;

  @override
  void initState()
  {
    startAnimation();
  }

    Future startSplashAnimation() async{
    await Future.delayed(Duration(milliseconds:500 ));
    
      animate.value = true;
    
    await Future.delayed(Duration(milliseconds:3000 ));
    animate.value = false;
    await Future.delayed(Duration(milliseconds:2000 ));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: context=>We))
    Get.offAll(()=> const WelcomeScreen());
    // Get.to(WelcomeScreen());
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds:500 ));
    animate.value = true;

  }
}