import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCollectionController extends GetxController{
  static DataCollectionController get find =>Get.find();
  RxBool animate = false.obs;


   var personality ="";
   var hobbies = "";
   var skills = "";
   var topics = "";

    Future setPreferences() async{

      final prefs = await SharedPreferences.getInstance();
   
      
     
      
 
  }

  
}