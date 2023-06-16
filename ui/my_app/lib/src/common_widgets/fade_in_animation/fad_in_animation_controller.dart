import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();
    final loggedin = prefs.getBool('loggedIn');
    
    await Future.delayed(Duration(milliseconds:3000 ));
    animate.value = false;
    await Future.delayed(Duration(milliseconds:2000 ));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: context=>We))
    if(loggedin!=null && loggedin == true) 
    {
      Get.offAll(()=>  LandingPage());
    }else
    {Get.offAll(()=> const WelcomeScreen());}
    // Get.to(WelcomeScreen());
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds:500 ));
    animate.value = true;

  }
}