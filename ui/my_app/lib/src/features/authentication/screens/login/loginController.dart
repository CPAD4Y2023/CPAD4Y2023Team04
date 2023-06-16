import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  static LoginController get find =>Get.find();
  RxBool animate = false.obs;

  

    Future loginClick() async{

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedIn',true);
      Get.offAll(()=>  LandingPage());
 
  }

  
}