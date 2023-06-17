import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileController extends GetxController{
  static UpdateProfileController get find =>Get.find();
 


   RxString personality ="".obs;
   RxString hobbies = "".obs;
   RxString skills = "".obs;
   RxString topics = "".obs;

    Future getPreferences() async{

      final prefs = await SharedPreferences.getInstance();
      // make an api call to fetch the user preferences.

      // store them in the preferences.
        var data = prefs.getString(pref_personality);
        if(data == null)
        {
          personality.value = "";
        }
        else
        {
          personality.value = data;
        }


        data = prefs.getString(pref_hobbies);
        if(data == null)
        {
          hobbies.value = "";
        }
        else
        {
          hobbies.value = data;
        }
        data = prefs.getString(pref_skills);
        if(data == null)
        {
          skills.value = "";
        }
        else
        {
          skills.value = data;
        }
        data = prefs.getString(pref_topics);
        if(data == null)
        {
          topics.value = "";
        }
        else
        {
          topics.value = data;
        }
      
     
      
 
  }

  
}