import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController extends GetxController{
  static LandingController get find =>Get.find();
  RxBool animate = false.obs;

@override
  void initState()
  {
    addPreferences();
  }
  

    Future addPreferences() async{

      final prefs = await SharedPreferences.getInstance();
      // make an api call to fetch the user preferences.

      // store them in the preferences.
      
      prefs.setString(pref_personality, "INTJ");
      prefs.setString(pref_hobbies, "puzzles, writing,problem solving,english,math");
      prefs.setString(pref_skills, "python,java,nlp");
      prefs.setString(pref_topics, "tech,finance,sports");
      
 
  }

  
}